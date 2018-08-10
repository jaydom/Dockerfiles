#!/bin/bash -e
echo "--------------------------------------------------------------"

echo "WARNING: this script HAS TO access internet (http/https/ftp),"
echo "so please make sure your network working properly!!"

mkdir -p ./logs

need_file(){
    for f in $*; do
        if [ ! -e $f ]; then
            echo "ERROR: $f does not exist."
            exit -1
        fi
    done
}

# Check extistence of prerequisites files
need_file dl_rpms.sh dl_other_from_centos_repo.sh tarball-dl.sh
need_file rpms_from_3rd_parties.lst
need_file rpms_from_centos_3rd_parties.lst
need_file rpms_from_centos_repo.lst
need_file other_downloads.lst
need_file tarball-dl.lst mvn-artifacts.lst

#download RPMs/SRPMs from 3rd_party websites (not CentOS repos) by "wget"
echo "step #1: start downloading RPMs/SRPMs from 3rd-party websites..."

# Restore StarlingX_3rd repos from backup
REPO_SOURCE_DIR=/localdisk/yum.repos.d
REPO_DIR=/etc/yum.repos.d
if [ -d $REPO_SOURCE_DIR ] && [ -d $REPO_DIR ]; then
    \cp -f $REPO_SOURCE_DIR/*.repo $REPO_DIR/
fi

rpm_downloader="./dl_rpms.sh"
$rpm_downloader ./rpms_from_3rd_parties.lst L1 3rd | tee ./logs/log_download_rpms_from_3rd_party.txt
if [ $? != 0 ];then
    echo "ERROR: something wrong with downloading, please check the log!!"
fi

# download RPMs/SRPMs from 3rd_party repos by "yumdownloader"
$rpm_downloader ./rpms_from_centos_3rd_parties.lst L1 3rd-centos | tee ./logs/log_download_rpms_from_centos_3rd_parties_L1.txt

# deleting the StarlingX_3rd to avoid pull centos packages from the 3rd Repo.
\rm -f $REPO_DIR/StarlingX_3rd*.repo



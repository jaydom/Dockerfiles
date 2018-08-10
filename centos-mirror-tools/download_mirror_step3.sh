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


echo "step #3: start downloading other files ..."

other_downloader="./dl_other_from_centos_repo.sh"
$other_downloader ./other_downloads.lst ./output/stx-r1/CentOS/pike/Binary/ | tee ./logs/log_download_other_files_centos.txt
if [ $? == 0 ];then
    echo "step #3: done successfully"
fi


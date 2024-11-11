#[공통 변경 사항]
source /usr/local/greenplum-db/greenplum_path.sh 주석  

#1. 1_diag_os.sh CTTTM4 install 가이드 문서의 OS 설정값들을 확인하는 스크립트 추가

#2. 2_diag_gpdb.sh
아래 파라미터는 v6 파라미터 이므로 해당 내용 주석처리
gp_workfile_compression
gp_resource_manager

gpcc pxf 명령어 변경
gpcc => gpcmcr --version >> ${LOGFILE}
pxf => gphdfs --version >> ${LOGFILE}


#3. 3_diag_gpupgrade.sh

명령어 변경
gpcmcr --version >> ${LOGFILE}
gphdfs --version >> ${LOGFILE}

#4. 7_diag_perf_dbstatus.sh 쿼리 구문 변경

gpmetrics => public
gpcc_disk_history => diskspace_history
gpcc_queries_history => queries_history

#8. 리소스 그룹 관련 (v4 미지원, 삭제)

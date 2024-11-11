# How to

1. enter gpadmin $HOME directory

   cd /home/gpadmin
2. Download assessment_gpdb_v4.zip

   git clone https://github.com/leeuijin/assessment_gpdb_v4.git
3. uncompress assessment_gpdb_v4.zip

   unzip assessment_gpdb_v4.zip

4. Execute

   cd diag

   sh 0_run_diag.sh
 
9. check output file

   cd diaglog

   ls

# Changes

#[공통 변경 사항]
source /usr/local/greenplum-db/greenplum_path.sh 주석  

1. 1_diag_os.sh CTTTM4 install 가이드 문서의 OS 설정값들을 확인하는 스크립트 추가
    <code>
          echo "" >> ${LOGFILE}
          echo "####################" >> ${LOGFILE}
          echo "### 14. GPDB v4 Configration Check" >> ${LOGFILE}
          echo "##################sudo ##" >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.shmmax' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.shmmni' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.shmall' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.sem' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.sysrq' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.core_uses_pid' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.msgmax' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep kernel.msgmni' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.tcp_syncookies' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.conf.default.accept_source_route' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.tcp_tw_recycle' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.tcp_max_syn_backlog' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.conf.all.arp_filter' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.ip_local_port_range' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv4.ip_forward' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.core.netdev_max_backlog' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.core.rmem_max' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.core.wmem_max' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep vm.swappiness' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep vm.overcommit_memory' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep vm.overcommit_ratio' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv6.conf.all.disable_ipv6' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv6.conf.default.disable_ipv6' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv6.conf.all.autoconf' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv6.conf.default.autoconf' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'sudo sysctl -a |grep net.ipv6.conf.default.autoconf' >> ${LOGFILE}
          gpssh -f ${HOSTFILE} 'systemctl status kdump' >> ${LOGFILE}
        echo "" >> ${LOGFILE}
        gpssh -f ${HOSTFILE} 'date' >> ${LOGFILE}
    </code>
2. 2_diag_gpdb.sh
    <code>
    아래 파라미터는 v6 파라미터 이므로 해당 내용 주석처리
            gp_workfile_compression    
            gp_resource_manager
    gpcc pxf 명령어 변경
            gpcc => gpcmcr --version >> ${LOGFILE}
            pxf => gphdfs --version >> ${LOGFILE}
    </code>

3. 3_diag_gpupgrade.sh
    <code>
    명령어 변경
    gpcmcr --version >> ${LOGFILE}
    gphdfs --version >> ${LOGFILE}
    </code>
    
4. 7_diag_perf_dbstatus.sh 쿼리 구문 변경
   <code>
   gpmetrics => public
   gpcc_disk_history => diskspace_history
   gpcc_queries_history => queries_history
   </code>
   
5. 8_diag_perf_resource.sh
   <code>
   리소스 그룹 관련 (v4 미지원, 삭제)
   </code>

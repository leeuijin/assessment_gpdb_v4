#!/bin/bash
#mkdir -p /home/gpadmin/diag/diaglog
#source /usr/local/greenplum-db/greenplum_path.sh
export LOGFILE=/home/gpadmin/diag/diaglog/diag_gpupgrade.$(date '+%Y%m%d_%H%M')
export HOSTFILE=/home/gpadmin/diag/hostfile_all

GPMAJOR=`gpstate --version | awk '{print $3}' | awk -F'.' '{print $1}'`
GPMINOR=`gpstate --version | awk '{print $3}' | awk -F'.' '{print $2}'`

echo "" > ${LOGFILE}
echo "####################" >> ${LOGFILE}
echo "### 1. GPDB version" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
gpstate --version >> ${LOGFILE}

echo "" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
echo "### 2. GPCC version" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
#/usr/local/greenplum-cc/bin/gpcc --version >> ${LOGFILE}
/usr/local/greenplum-cc-web/bin/gpcmdr --version >> ${LOGFILE}

echo "" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
echo "### 3. GPHDFS version" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
if [ ${GPMAJOR} -eq 6 ] && [ ${GPMINOR} -le 18 ]
then
	gphdfs --version >> ${LOGFILE}
elif [ ${GPMAJOR} -eq 6 ] && [ ${GPMINOR} -gt 18 ]
then
	gphdfs --version >> ${LOGFILE}
else
	echo "Please check the PXF version manually" >> ${LOGFILE}
fi

echo "" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
echo "### 4. gppkg list" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
gppkg -q --all >> ${LOGFILE}

echo "" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
echo "### 5. Mirror config check" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
psql -c "select * from gp_segment_configuration order by 2,1;" >> ${LOGFILE}

echo "" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
echo "### 6. Install directory check" >> ${LOGFILE}
echo "####################" >> ${LOGFILE}
gpssh -f ${HOSTFILE} 'ls -al /usr/local/' >> ${LOGFILE}

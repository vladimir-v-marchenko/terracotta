@echo off
cls
SET CUR_DIR=%CD%
set errorLevel=0
call mvn -v || set errorLevel=1
if %errorLevel% == 1 (
  echo Maven command not found, please install
  EXIT /B 1
)

echo Configure wiperdog with Job Manager
move wiperdog\bin\ListBundle.csv wiperdog\bin\ListBundle.csv_bak
copy terracottaWithWiperdogUseJobManager\bin\ListBundle.csv wiperdog\bin\ListBundle.csv
move wiperdog\bin\startGroovy wiperdog\bin\startGroovy_bak
copy terracottaWithWiperdogUseJobManager\bin\startGroovy wiperdog\bin\startGroovy
move wiperdog\bin\startGroovy.bat wiperdog\bin\startGroovy.bat_bak
copy terracottaWithWiperdogUseJobManager\bin\startGroovy.bat wiperdog\bin\startGroovy.bat

move wiperdog\etc\boot.groovy wiperdog\etc\boot.groovy_bak
copy terracottaWithWiperdogUseJobManager\etc\boot.groovy wiperdog\etc\boot.groovy
move wiperdog\etc\config.properties wiperdog\etc\config.properties_bak
copy terracottaWithWiperdogUseJobManager\etc\config.properties wiperdog\etc\config.properties
@rem copy terracottaWithWiperdogUseJobManager\etc\quartz.properties wiperdog\etc\quartz.properties

move wiperdog\lib\groovy\libs.common\MonitorJobConfigLoader.groovy wiperdog\lib\groovy\libs.common\MonitorJobConfigLoader.groovy_bak
copy terracottaWithWiperdogUseJobManager\lib\groovy\libs.common\MonitorJobConfigLoader.groovy wiperdog\lib\groovy\libs.common\MonitorJobConfigLoader.groovy
copy terracottaWithWiperdogUseJobManager\lib\groovy\libs.common\Terracotta_Prototype.groovy wiperdog\lib\groovy\libs.common\Terracotta_Prototype.groovy

move wiperdog\lib\groovy\libs.target\DefaultJobCaller.groovy wiperdog\lib\groovy\libs.target\DefaultJobCaller.groovy_bak
copy terracottaWithWiperdogUseJobManager\lib\groovy\libs.target\DefaultJobCaller.groovy wiperdog\lib\groovy\libs.target\DefaultJobCaller.groovy
move wiperdog\lib\groovy\libs.target\DefaultSender.groovy wiperdog\lib\groovy\libs.target\DefaultSender.groovy_bak
copy terracottaWithWiperdogUseJobManager\lib\groovy\libs.target\DefaultSender.groovy wiperdog\lib\groovy\libs.target\DefaultSender.groovy
move wiperdog\lib\groovy\libs.target\GroovyScheduledJob.groovy wiperdog\lib\groovy\libs.target\GroovyScheduledJob.groovy_bak
copy terracottaWithWiperdogUseJobManager\lib\groovy\libs.target\GroovyScheduledJob.groovy wiperdog\lib\groovy\libs.target\GroovyScheduledJob.groovy
move wiperdog\lib\groovy\libs.target\JobDsl.groovy wiperdog\lib\groovy\libs.target\JobDsl.groovy_bak
copy terracottaWithWiperdogUseJobManager\lib\groovy\libs.target\JobDsl.groovy wiperdog\lib\groovy\libs.target\JobDsl.groovy

move wiperdog\lib\java\bundle\org.wiperdog.jobmanager-0.2.1.jar wiperdog\lib\java\bundle\org.wiperdog.jobmanager-0.2.1.jar_bak
@rem copy terracottaWithWiperdogUseJobManager\lib\java\bundle\org.wiperdog.jobmanager-0.2.1.jar wiperdog\lib\java\bundle\org.wiperdog.jobmanager-0.2.1.jar
if not exist org.wiperdog.jobmanager (
  git --version >nul 2>&1 && ( 
    git clone https://github.com/dothihuong-luvina/org.wiperdog.jobmanager
  ) || ( 
    echo git command not found. Please install it 
    echo Try this http://msysgit.github.io/
    EXIT /B 1
  )
)
cd org.wiperdog.jobmanager
call mvn install -DskipTests
cd %CUR_DIR%
copy org.wiperdog.jobmanager\target\org.wiperdog.jobmanager-0.2.1.jar wiperdog\lib\java\bundle\org.wiperdog.jobmanager-0.2.1.jar
@rem copy terracottaWithWiperdogUseJobManager\lib\java\bundle\quartz-2.2.1.jar wiperdog\lib\java\bundle\quartz-2.2.1.jar
copy quartz-2.2.1\target\quartz-2.2.1.jar wiperdog\lib\java\bundle\quartz-2.2.1.jar
copy terracottaWithWiperdogUseJobManager\var\job\job1.job wiperdog\var\job\job1.job
copy terracottaWithWiperdogUseJobManager\var\job\trigger.trg wiperdog\var\job\trigger.trg
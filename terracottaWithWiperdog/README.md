1. �ړI
	demoTerracottaOSGI��Terracotta��OSGI�V�X�e���̒��Ɏg���܂�����A
	Wiperdog��TerraCotta���g���邩�ǂ����m�F���邽�߂ɁA�K�v�ȏC�������āA�m�F���Ă݂܂��B
	�����Script���g���āATerracotta��Wiperdog�̎��s����Demo���쐬�ł��܂��B
2. Wiperdog��Terracotta�����s�ł�������F
	Wiperdog�\�[�X��ύX���Ȃ���΂Ȃ�܂���B
		Bundle:
			Terracotta�����s�ł��邽�߂ɁA���݂�Wiperdog Bundle���C�����Ȃ���΂Ȃ�Ȃ��B
			- quartz:�@�K�v��TerraCotta Library�ƃ}�[�W����B
				���̂��߁A�C������pom�t�@�C���iterracottaWithWiperdog\quartz\pom.xml�j���g���āAquartz bundle��������xBuilt����B
			- jobmanager bundle�F�@ObjectJob�N���X��Export���邽�߁A�C������B
		Text file/Others
			�K�v�ȃt�@�C����ύX����B
3. �\�[�X
	���݂Q�ꍇ��Ή����Ă��܂��F
		Jobmanager���g��
		JobManager���g��Ȃ��āAJobmanager�̑���ɁAJob�����s���邽�߂ɁAGroovy�\�[�X�����܂��B
	Terracotta�����s�ł��邽�߂ɁA���݂�Wiperdog�̂��������̂��C������͕̂K�v�ł��B�ȏ�̏ꍇ�ɂ���āA�Ⴂ�܂��B
		
	�\�[�X�͈ȉ��̂��̂��܂݂܂��F
		1. Demo���쐬����Script:�@startWiperdogWithTerracotta.sh/startWiperdogWithTerracotta.bat
			����Script�̒��Ɉȉ��̂��Ƃ����܂��F
			    - Maven����wiperdog installer�擾����B
			    - wiperdog��Install����B
			�@�@- Quartz��Jobmanager bundle��ReInstall����B
				Quart�Fhttp://svn.terracotta.org/svn/quartz/tags/quartz-2.2.1/quartz/����擾���āA
					�C������pom�t�@�C���iterracottaWithWiperdog\quartz\pom.xml�j���g���āA������xBuilt����
				Jobmanager�Fhttps://github.com/dothihuong-luvina/org.wiperdog.jobmanager����擾���āABuilt����
			    - Jobmanager���g�����g��Ȃ����ɂ���āA�ύX���̂�Wiperdog�ɏ㏑���܂��iBundle�ƕK�v�ȃt�@�C���j
				Jobmanager���g���F
					ReInstall����Quart
					�V����Built����Jobmanager
					terracottaWithWiperdog\terracottaWithWiperdogUseJobManager�̃\�[�X
				JobManager���g��Ȃ��F
					ReInstall����Quart
					terracottaWithWiperdog\terracottaWithWiperdogUseJobManager�̃\�[�X
		2. Others:
			terracottaWithWiperdog\quartz�F
				�C�����ꂽpom�t�@�C���AQuartz��Reinstall���邽��
			terracottaWithWiperdog\terracottaWithWiperdogUseGroovyScript�F
				JobManager���g��Ȃ��āAJobmanager�̑���ɁAJob�����s���邽�߂�Groovy Script�ƕK�v�ȃt�@�C��
			terracottaWithWiperdog\terracottaWithWiperdogUseJobManager�F
				Jobmanager���g���ꍇ�̕ύX�����t�@�C��
4�D���s
	4.1. Start terracotta server:
		4.1.1 Checkout from SVN, update some pom files, built necessary libaries, follow this link:
			https://github.com/wiperdog/experimental/tree/master/terracotta
		4.1.2 Deploy:
			Go to checkouted folder of http://svn.terracotta.org/svn/tc/dso/tags/4.1.1/deploy, run command:
			mvn exec:exec -P start-server
	4.2. Checkout sources:
		https://github.com/dothihuong-luvina/terracotta.git
	4.3. In terracottaWithWiperdog folder, run file startWiperdogWithTerracotta.bat/startWiperdogWithTerracotta.sh
   		Use /h for help
   	
	*** Note: When run wiperdog with terracotta, all object which need to run job will be cached. 
          So, if you run wiperdog with jobmanager, and then, 
             you want run using groovy source, without jobmanager, you need restart terracotta server.
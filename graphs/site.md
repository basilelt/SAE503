```mermaid
---
title: Ansible Playbook Graph
---
%%{ init: { "flowchart": { "curve": "bumpX" } } }%%
flowchart LR
	%% Start of the playbook 'SAE503/k3s-ansible/site.yml'
	playbook_1bf0791a("SAE503/k3s-ansible/site.yml")
		%% Start of the play 'Play: Pre tasks (3)'
		play_4bc5a3e8["Play: Pre tasks (3)"]
		style play_4bc5a3e8 fill:#434689,color:#ffffff
		playbook_1bf0791a --> |"1"| play_4bc5a3e8
		linkStyle 0 stroke:#434689,color:#434689
			pre_task_1a81121f["[pre_task]  Verify Ansible is version 2.11 or above. (If this fails you may need to update Ansible)"]
			style pre_task_1a81121f stroke:#434689,fill:#ffffff
			play_4bc5a3e8 --> |"1"| pre_task_1a81121f
			linkStyle 1 stroke:#434689,color:#434689
		%% End of the play 'Play: Pre tasks (3)'
		%% Start of the play 'Play: Prepare k3s nodes (3)'
		play_481a8888["Play: Prepare k3s nodes (3)"]
		style play_481a8888 fill:#8016b6,color:#ffffff
		playbook_1bf0791a --> |"3"| play_481a8888
		linkStyle 2 stroke:#8016b6,color:#8016b6
			%% Start of the role 'prereq'
			play_481a8888 --> |"1"| role_59d36f0b
			linkStyle 3 stroke:#8016b6,color:#8016b6
			role_59d36f0b(["[role] prereq"])
			style role_59d36f0b fill:#8016b6,color:#ffffff,stroke:#8016b6
				task_da63ba04[" prereq : Validating arguments against arg spec 'main' - Prerequisites"]
				style task_da63ba04 stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"1"| task_da63ba04
				linkStyle 4 stroke:#8016b6,color:#8016b6
				task_8ff16a7c[" prereq : Set same timezone on every Server"]
				style task_8ff16a7c stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"2 [when: (system_timezone is defined) and (system_timezone != 'Your/Timezone')]"| task_8ff16a7c
				linkStyle 5 stroke:#8016b6,color:#8016b6
				task_f27e8c9e[" prereq : Set SELinux to disabled state"]
				style task_f27e8c9e stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"3 [when: ansible_os_family == 'RedHat']"| task_f27e8c9e
				linkStyle 6 stroke:#8016b6,color:#8016b6
				task_993855c0[" prereq : Enable IPv4 forwarding"]
				style task_993855c0 stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"4"| task_993855c0
				linkStyle 7 stroke:#8016b6,color:#8016b6
				task_ff950096[" prereq : Enable IPv6 forwarding"]
				style task_ff950096 stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"5"| task_ff950096
				linkStyle 8 stroke:#8016b6,color:#8016b6
				task_2621f1ac[" prereq : Enable IPv6 router advertisements"]
				style task_2621f1ac stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"6"| task_2621f1ac
				linkStyle 9 stroke:#8016b6,color:#8016b6
				task_0d9e57e8[" prereq : Add br_netfilter to /etc/modules-load.d/"]
				style task_0d9e57e8 stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"7 [when: ansible_os_family == 'RedHat']"| task_0d9e57e8
				linkStyle 10 stroke:#8016b6,color:#8016b6
				task_3f2084e2[" prereq : Load br_netfilter"]
				style task_3f2084e2 stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"8 [when: ansible_os_family == 'RedHat']"| task_3f2084e2
				linkStyle 11 stroke:#8016b6,color:#8016b6
				task_237fdd2e[" prereq : Set bridge-nf-call-iptables (just to be sure)"]
				style task_237fdd2e stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"9 [when: ansible_os_family == 'RedHat']"| task_237fdd2e
				linkStyle 12 stroke:#8016b6,color:#8016b6
				task_d762c26e[" prereq : Add /usr/local/bin to sudo secure_path"]
				style task_d762c26e stroke:#8016b6,fill:#ffffff
				role_59d36f0b --> |"10 [when: ansible_os_family in [ 'RedHat', 'Suse' ]]"| task_d762c26e
				linkStyle 13 stroke:#8016b6,color:#8016b6
			%% End of the role 'prereq'
			%% Start of the role 'download'
			play_481a8888 --> |"2"| role_8752b648
			linkStyle 14 stroke:#8016b6,color:#8016b6
			role_8752b648(["[role] download"])
			style role_8752b648 fill:#8016b6,color:#ffffff,stroke:#8016b6
				task_9200f90a[" download : Validating arguments against arg spec 'main' - Manage the downloading of K3S binaries"]
				style task_9200f90a stroke:#8016b6,fill:#ffffff
				role_8752b648 --> |"1"| task_9200f90a
				linkStyle 15 stroke:#8016b6,color:#8016b6
				task_f14dbb4d[" download : Download k3s binary x64"]
				style task_f14dbb4d stroke:#8016b6,fill:#ffffff
				role_8752b648 --> |"2 [when: ansible_facts.architecture == 'x86_64']"| task_f14dbb4d
				linkStyle 16 stroke:#8016b6,color:#8016b6
				task_b6f8a504[" download : Download k3s binary arm64"]
				style task_b6f8a504 stroke:#8016b6,fill:#ffffff
				role_8752b648 --> |"3 [when: ( ansible_facts.architecture is search('arm') and ansible_facts.userspace_bits == '64' ) or ansible_facts.architecture is search('aarch64')]"| task_b6f8a504
				linkStyle 17 stroke:#8016b6,color:#8016b6
				task_a2185085[" download : Download k3s binary armhf"]
				style task_a2185085 stroke:#8016b6,fill:#ffffff
				role_8752b648 --> |"4 [when: ansible_facts.architecture is search('arm') and ansible_facts.userspace_bits == '32']"| task_a2185085
				linkStyle 18 stroke:#8016b6,color:#8016b6
			%% End of the role 'download'
			%% Start of the role 'k3s_custom_registries'
			play_481a8888 --> |"3"| role_5cb4fed6
			linkStyle 19 stroke:#8016b6,color:#8016b6
			role_5cb4fed6(["[role] k3s_custom_registries"])
			style role_5cb4fed6 fill:#8016b6,color:#ffffff,stroke:#8016b6
				task_8cee24c1[" k3s_custom_registries : Validating arguments against arg spec 'main' - Configure the use of a custom container registry"]
				style task_8cee24c1 stroke:#8016b6,fill:#ffffff
				role_5cb4fed6 --> |"1 [when: custom_registries]"| task_8cee24c1
				linkStyle 20 stroke:#8016b6,color:#8016b6
				task_92d8c36d[" k3s_custom_registries : Create directory /etc/rancher/k3s"]
				style task_92d8c36d stroke:#8016b6,fill:#ffffff
				role_5cb4fed6 --> |"2 [when: custom_registries]"| task_92d8c36d
				linkStyle 21 stroke:#8016b6,color:#8016b6
				task_514f8cc3[" k3s_custom_registries : Insert registries into /etc/rancher/k3s/registries.yaml"]
				style task_514f8cc3 stroke:#8016b6,fill:#ffffff
				role_5cb4fed6 --> |"3 [when: custom_registries]"| task_514f8cc3
				linkStyle 22 stroke:#8016b6,color:#8016b6
			%% End of the role 'k3s_custom_registries'
		%% End of the play 'Play: Prepare k3s nodes (3)'
		%% Start of the play 'Play: Setup k3s servers (1)'
		play_ecaafc9b["Play: Setup k3s servers (1)"]
		style play_ecaafc9b fill:#8a3b91,color:#ffffff
		playbook_1bf0791a --> |"4"| play_ecaafc9b
		linkStyle 23 stroke:#8a3b91,color:#8a3b91
			%% Start of the role 'k3s_server'
			play_ecaafc9b --> |"1"| role_e2ed35a0
			linkStyle 24 stroke:#8a3b91,color:#8a3b91
			role_e2ed35a0(["[role] k3s_server"])
			style role_e2ed35a0 fill:#8a3b91,color:#ffffff,stroke:#8a3b91
				task_f4ff2acc[" k3s_server : Validating arguments against arg spec 'main' - Setup k3s servers"]
				style task_f4ff2acc stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"1"| task_f4ff2acc
				linkStyle 25 stroke:#8a3b91,color:#8a3b91
				task_8213b889[" k3s_server : Stop k3s-init"]
				style task_8213b889 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"2"| task_8213b889
				linkStyle 26 stroke:#8a3b91,color:#8a3b91
				task_699b804a[" k3s_server : Stop k3s"]
				style task_699b804a stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"3"| task_699b804a
				linkStyle 27 stroke:#8a3b91,color:#8a3b91
				task_69dc1d33[" k3s_server : Clean previous runs of k3s-init"]
				style task_69dc1d33 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"4"| task_69dc1d33
				linkStyle 28 stroke:#8a3b91,color:#8a3b91
				task_e16521e7[" k3s_server : Create k3s.service.d directory"]
				style task_e16521e7 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"5"| task_e16521e7
				linkStyle 29 stroke:#8a3b91,color:#8a3b91
				task_39bb58e7[" k3s_server : Copy K3s http_proxy conf file"]
				style task_39bb58e7 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"6"| task_39bb58e7
				linkStyle 30 stroke:#8a3b91,color:#8a3b91
				task_b0458e1f[" k3s_server : Set _kube_vip_bgp_peers fact"]
				style task_b0458e1f stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"7"| task_b0458e1f
				linkStyle 31 stroke:#8a3b91,color:#8a3b91
				task_27e31513[" k3s_server : Create manifests directory on first master"]
				style task_27e31513 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_27e31513
				linkStyle 32 stroke:#8a3b91,color:#8a3b91
				task_9c6205ab[" k3s_server : Download vip rbac manifest to first master"]
				style task_9c6205ab stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_9c6205ab
				linkStyle 33 stroke:#8a3b91,color:#8a3b91
				task_b3d56f9b[" k3s_server : Copy vip manifest to first master"]
				style task_b3d56f9b stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"10 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_b3d56f9b
				linkStyle 34 stroke:#8a3b91,color:#8a3b91
				task_22d4c8d9[" k3s_server : Create manifests directory on first master"]
				style task_22d4c8d9 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"11 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_22d4c8d9
				linkStyle 35 stroke:#8a3b91,color:#8a3b91
				task_44faa09d[" k3s_server : Download to first master: manifest for metallb-native"]
				style task_44faa09d stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"12 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_44faa09d
				linkStyle 36 stroke:#8a3b91,color:#8a3b91
				task_a3ac821f[" k3s_server : Set image versions in manifest for metallb-native"]
				style task_a3ac821f stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"13 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_a3ac821f
				linkStyle 37 stroke:#8a3b91,color:#8a3b91
				task_b00bab77[" k3s_server : Create manifests directory on first master"]
				style task_b00bab77 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"14 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_b00bab77
				linkStyle 38 stroke:#8a3b91,color:#8a3b91
				task_1a787504[" k3s_server : Download vip cloud provider manifest to first master"]
				style task_1a787504 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"15 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_1a787504
				linkStyle 39 stroke:#8a3b91,color:#8a3b91
				task_de2f4009[" k3s_server : Copy kubevip configMap manifest to first master"]
				style task_de2f4009 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"16 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_de2f4009
				linkStyle 40 stroke:#8a3b91,color:#8a3b91
				task_76a23a75[" k3s_server : Init cluster inside the transient k3s-init service"]
				style task_76a23a75 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"17"| task_76a23a75
				linkStyle 41 stroke:#8a3b91,color:#8a3b91
				%% Start of the block 'Verification'
				block_f0862e8e["[block] Verification"]
				style block_f0862e8e fill:#8a3b91,color:#ffffff,stroke:#8a3b91
				role_e2ed35a0 --> |"18 [when: not ansible_check_mode]"| block_f0862e8e
				linkStyle 42 stroke:#8a3b91,color:#8a3b91
				subgraph subgraph_block_f0862e8e["Verification "]
					task_ac58324a[" k3s_server : Verify that all nodes actually joined (check k3s-init.service if this fails)"]
					style task_ac58324a stroke:#8a3b91,fill:#ffffff
					block_f0862e8e --> |"1 [when: not ansible_check_mode]"| task_ac58324a
					linkStyle 43 stroke:#8a3b91,color:#8a3b91
				end
				%% End of the block 'Verification'
				task_353e94f1[" k3s_server : Copy K3s service file"]
				style task_353e94f1 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"19"| task_353e94f1
				linkStyle 44 stroke:#8a3b91,color:#8a3b91
				task_ec70a758[" k3s_server : Enable and check K3s service"]
				style task_ec70a758 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"20"| task_ec70a758
				linkStyle 45 stroke:#8a3b91,color:#8a3b91
				task_abf8f326[" k3s_server : Wait for node-token"]
				style task_abf8f326 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"21"| task_abf8f326
				linkStyle 46 stroke:#8a3b91,color:#8a3b91
				task_afc451ab[" k3s_server : Register node-token file access mode"]
				style task_afc451ab stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"22"| task_afc451ab
				linkStyle 47 stroke:#8a3b91,color:#8a3b91
				task_9bb41ad7[" k3s_server : Change file access node-token"]
				style task_9bb41ad7 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"23"| task_9bb41ad7
				linkStyle 48 stroke:#8a3b91,color:#8a3b91
				task_a5fb2a10[" k3s_server : Read node-token from master"]
				style task_a5fb2a10 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"24"| task_a5fb2a10
				linkStyle 49 stroke:#8a3b91,color:#8a3b91
				task_ec9ba9a2[" k3s_server : Store Master node-token"]
				style task_ec9ba9a2 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"25"| task_ec9ba9a2
				linkStyle 50 stroke:#8a3b91,color:#8a3b91
				task_0264355c[" k3s_server : Restore node-token file access"]
				style task_0264355c stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"26"| task_0264355c
				linkStyle 51 stroke:#8a3b91,color:#8a3b91
				task_6c108d28[" k3s_server : Create directory .kube"]
				style task_6c108d28 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"27"| task_6c108d28
				linkStyle 52 stroke:#8a3b91,color:#8a3b91
				task_b6d615ad[" k3s_server : Copy config file to user home directory"]
				style task_b6d615ad stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"28"| task_b6d615ad
				linkStyle 53 stroke:#8a3b91,color:#8a3b91
				task_56158df7[" k3s_server : Configure kubectl cluster to {{ endpoint_url }}"]
				style task_56158df7 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"29"| task_56158df7
				linkStyle 54 stroke:#8a3b91,color:#8a3b91
				task_68de1258[" k3s_server : Create kubectl symlink"]
				style task_68de1258 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"30 [when: k3s_create_kubectl_symlink | default(true) | bool]"| task_68de1258
				linkStyle 55 stroke:#8a3b91,color:#8a3b91
				task_d4760a2b[" k3s_server : Create crictl symlink"]
				style task_d4760a2b stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"31 [when: k3s_create_crictl_symlink | default(true) | bool]"| task_d4760a2b
				linkStyle 56 stroke:#8a3b91,color:#8a3b91
				task_9eac051f[" k3s_server : Get contents of manifests folder"]
				style task_9eac051f stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"32"| task_9eac051f
				linkStyle 57 stroke:#8a3b91,color:#8a3b91
				task_2b3ca700[" k3s_server : Get sub dirs of manifests folder"]
				style task_2b3ca700 stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"33"| task_2b3ca700
				linkStyle 58 stroke:#8a3b91,color:#8a3b91
				task_33ff1a6c[" k3s_server : Remove manifests and folders that are only needed for bootstrapping cluster so k3s doesn't auto apply on start"]
				style task_33ff1a6c stroke:#8a3b91,fill:#ffffff
				role_e2ed35a0 --> |"34"| task_33ff1a6c
				linkStyle 59 stroke:#8a3b91,color:#8a3b91
			%% End of the role 'k3s_server'
		%% End of the play 'Play: Setup k3s servers (1)'
		%% Start of the play 'Play: Setup k3s agents (2)'
		play_4f224f9c["Play: Setup k3s agents (2)"]
		style play_4f224f9c fill:#34c804,color:#ffffff
		playbook_1bf0791a --> |"5"| play_4f224f9c
		linkStyle 60 stroke:#34c804,color:#34c804
			%% Start of the role 'k3s_agent'
			play_4f224f9c --> |"1"| role_66522cff
			linkStyle 61 stroke:#34c804,color:#34c804
			role_66522cff(["[role] k3s_agent"])
			style role_66522cff fill:#34c804,color:#ffffff,stroke:#34c804
				task_329e3f95[" k3s_agent : Validating arguments against arg spec 'main' - Setup k3s agents"]
				style task_329e3f95 stroke:#34c804,fill:#ffffff
				role_66522cff --> |"1"| task_329e3f95
				linkStyle 62 stroke:#34c804,color:#34c804
				%% Start of the block 'Check for PXE-booted system'
				block_3735280e["[block] Check for PXE-booted system"]
				style block_3735280e fill:#34c804,color:#ffffff,stroke:#34c804
				role_66522cff --> |"2"| block_3735280e
				linkStyle 63 stroke:#34c804,color:#34c804
				subgraph subgraph_block_3735280e["Check for PXE-booted system "]
					task_7d3fb38d[" k3s_agent : Check if system is PXE-booted"]
					style task_7d3fb38d stroke:#34c804,fill:#ffffff
					block_3735280e --> |"1"| task_7d3fb38d
					linkStyle 64 stroke:#34c804,color:#34c804
					task_119b2cde[" k3s_agent : Set fact for PXE-booted system"]
					style task_119b2cde stroke:#34c804,fill:#ffffff
					block_3735280e --> |"2 [when: boot_cmdline.stdout is defined]"| task_119b2cde
					linkStyle 65 stroke:#34c804,color:#34c804
					task_9e6d617c[" k3s_agent : Create k3s-node.service.d directory"]
					style task_9e6d617c stroke:#34c804,fill:#ffffff
					block_3735280e --> |"3 [when: proxy_env is defined]"| task_9e6d617c
					linkStyle 66 stroke:#34c804,color:#34c804
					task_62a43ceb[" k3s_agent : Copy K3s http_proxy conf file"]
					style task_62a43ceb stroke:#34c804,fill:#ffffff
					block_3735280e --> |"4 [when: proxy_env is defined]"| task_62a43ceb
					linkStyle 67 stroke:#34c804,color:#34c804
				end
				%% End of the block 'Check for PXE-booted system'
				task_edf75932[" k3s_agent : Create k3s-node.service.d directory"]
				style task_edf75932 stroke:#34c804,fill:#ffffff
				role_66522cff --> |"3 [when: proxy_env is defined]"| task_edf75932
				linkStyle 68 stroke:#34c804,color:#34c804
				task_c4157e32[" k3s_agent : Copy K3s http_proxy conf file"]
				style task_c4157e32 stroke:#34c804,fill:#ffffff
				role_66522cff --> |"4 [when: proxy_env is defined]"| task_c4157e32
				linkStyle 69 stroke:#34c804,color:#34c804
				task_34629387[" k3s_agent : Configure the k3s service"]
				style task_34629387 stroke:#34c804,fill:#ffffff
				role_66522cff --> |"5"| task_34629387
				linkStyle 70 stroke:#34c804,color:#34c804
				task_559aab65[" k3s_agent : Manage k3s service"]
				style task_559aab65 stroke:#34c804,fill:#ffffff
				role_66522cff --> |"6"| task_559aab65
				linkStyle 71 stroke:#34c804,color:#34c804
			%% End of the role 'k3s_agent'
		%% End of the play 'Play: Setup k3s agents (2)'
		%% Start of the play 'Play: Configure k3s cluster (1)'
		play_56d25ccc["Play: Configure k3s cluster (1)"]
		style play_56d25ccc fill:#5e7359,color:#ffffff
		playbook_1bf0791a --> |"6"| play_56d25ccc
		linkStyle 72 stroke:#5e7359,color:#5e7359
			%% Start of the role 'k3s_server_post'
			play_56d25ccc --> |"1"| role_cff05bde
			linkStyle 73 stroke:#5e7359,color:#5e7359
			role_cff05bde(["[role] k3s_server_post"])
			style role_cff05bde fill:#5e7359,color:#ffffff,stroke:#5e7359
				task_b4c63596[" k3s_server_post : Validating arguments against arg spec 'main' - Configure k3s cluster"]
				style task_b4c63596 stroke:#5e7359,fill:#ffffff
				role_cff05bde --> |"1"| task_b4c63596
				linkStyle 74 stroke:#5e7359,color:#5e7359
				%% Start of the block 'Deploy Calico to cluster'
				block_b50ef8db["[block] Deploy Calico to cluster"]
				style block_b50ef8db fill:#5e7359,color:#ffffff,stroke:#5e7359
				role_cff05bde --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_b50ef8db
				linkStyle 75 stroke:#5e7359,color:#5e7359
				subgraph subgraph_block_b50ef8db["Deploy Calico to cluster "]
					task_5aacf377[" k3s_server_post : Create manifests directory on first master"]
					style task_5aacf377 stroke:#5e7359,fill:#ffffff
					block_b50ef8db --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_5aacf377
					linkStyle 76 stroke:#5e7359,color:#5e7359
					task_99dd51bf[" k3s_server_post : Download to first master: manifest for Tigera Operator and Calico CRDs"]
					style task_99dd51bf stroke:#5e7359,fill:#ffffff
					block_b50ef8db --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_99dd51bf
					linkStyle 77 stroke:#5e7359,color:#5e7359
					task_58415bdf[" k3s_server_post : Copy Calico custom resources manifest to first master"]
					style task_58415bdf stroke:#5e7359,fill:#ffffff
					block_b50ef8db --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_58415bdf
					linkStyle 78 stroke:#5e7359,color:#5e7359
					%% Start of the block 'Deploy or replace Tigera Operator'
					block_5a3616bd["[block] Deploy or replace Tigera Operator"]
					style block_5a3616bd fill:#5e7359,color:#ffffff,stroke:#5e7359
					block_b50ef8db --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_5a3616bd
					linkStyle 79 stroke:#5e7359,color:#5e7359
					subgraph subgraph_block_5a3616bd["Deploy or replace Tigera Operator "]
						task_18002b34[" k3s_server_post : Deploy Tigera Operator"]
						style task_18002b34 stroke:#5e7359,fill:#ffffff
						block_5a3616bd --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_18002b34
						linkStyle 80 stroke:#5e7359,color:#5e7359
						task_4f8dac4c[" k3s_server_post : Wait for Tigera Operator resources"]
						style task_4f8dac4c stroke:#5e7359,fill:#ffffff
						block_5a3616bd --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_4f8dac4c
						linkStyle 81 stroke:#5e7359,color:#5e7359
						%% Start of the block 'Deploy Calico custom resources'
						block_a5e7957b["[block] Deploy Calico custom resources"]
						style block_a5e7957b fill:#5e7359,color:#ffffff,stroke:#5e7359
						block_5a3616bd --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_a5e7957b
						linkStyle 82 stroke:#5e7359,color:#5e7359
						subgraph subgraph_block_a5e7957b["Deploy Calico custom resources "]
							task_82bbadda[" k3s_server_post : Deploy custom resources for Calico"]
							style task_82bbadda stroke:#5e7359,fill:#ffffff
							block_a5e7957b --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_82bbadda
							linkStyle 83 stroke:#5e7359,color:#5e7359
							task_55d0d17b[" k3s_server_post : Wait for Calico system resources to be available"]
							style task_55d0d17b stroke:#5e7359,fill:#ffffff
							block_a5e7957b --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_55d0d17b
							linkStyle 84 stroke:#5e7359,color:#5e7359
							task_8a7b588c[" k3s_server_post : Patch Felix configuration for eBPF mode"]
							style task_8a7b588c stroke:#5e7359,fill:#ffffff
							block_a5e7957b --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and calico_ebpf]"| task_8a7b588c
							linkStyle 85 stroke:#5e7359,color:#5e7359
							%% Start of the block 'Prepare Cilium CLI on first master and deploy CNI'
							block_4c13eab9["[block] Prepare Cilium CLI on first master and deploy CNI"]
							style block_4c13eab9 fill:#5e7359,color:#ffffff,stroke:#5e7359
							block_a5e7957b --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_4c13eab9
							linkStyle 86 stroke:#5e7359,color:#5e7359
							subgraph subgraph_block_4c13eab9["Prepare Cilium CLI on first master and deploy CNI "]
								task_8ef4e632[" k3s_server_post : Create tmp directory on first master"]
								style task_8ef4e632 stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_8ef4e632
								linkStyle 87 stroke:#5e7359,color:#5e7359
								task_5a74df46[" k3s_server_post : Check if Cilium CLI is installed"]
								style task_5a74df46 stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_5a74df46
								linkStyle 88 stroke:#5e7359,color:#5e7359
								task_46b5f01c[" k3s_server_post : Check for Cilium CLI version in command output"]
								style task_46b5f01c stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_installed.rc == 0]"| task_46b5f01c
								linkStyle 89 stroke:#5e7359,color:#5e7359
								task_8fc0c4e2[" k3s_server_post : Get latest stable Cilium CLI version file"]
								style task_8fc0c4e2 stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_8fc0c4e2
								linkStyle 90 stroke:#5e7359,color:#5e7359
								task_cf9ebc91[" k3s_server_post : Read Cilium CLI stable version from file"]
								style task_cf9ebc91 stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_cf9ebc91
								linkStyle 91 stroke:#5e7359,color:#5e7359
								task_551c02dd[" k3s_server_post : Log installed Cilium CLI version"]
								style task_551c02dd stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_551c02dd
								linkStyle 92 stroke:#5e7359,color:#5e7359
								task_0f868024[" k3s_server_post : Log latest stable Cilium CLI version"]
								style task_0f868024 stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_0f868024
								linkStyle 93 stroke:#5e7359,color:#5e7359
								task_2317e418[" k3s_server_post : Determine if Cilium CLI needs installation or update"]
								style task_2317e418 stroke:#5e7359,fill:#ffffff
								block_4c13eab9 --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_2317e418
								linkStyle 94 stroke:#5e7359,color:#5e7359
								%% Start of the block 'Install or update Cilium CLI'
								block_fe378479["[block] Install or update Cilium CLI"]
								style block_fe378479 fill:#5e7359,color:#ffffff,stroke:#5e7359
								block_4c13eab9 --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| block_fe378479
								linkStyle 95 stroke:#5e7359,color:#5e7359
								subgraph subgraph_block_fe378479["Install or update Cilium CLI "]
									task_8d0d10c1[" k3s_server_post : Set architecture variable"]
									style task_8d0d10c1 stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_8d0d10c1
									linkStyle 96 stroke:#5e7359,color:#5e7359
									task_40f795df[" k3s_server_post : Download Cilium CLI and checksum"]
									style task_40f795df stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_40f795df
									linkStyle 97 stroke:#5e7359,color:#5e7359
									task_89798eeb[" k3s_server_post : Verify the downloaded tarball"]
									style task_89798eeb stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_89798eeb
									linkStyle 98 stroke:#5e7359,color:#5e7359
									task_2c21c59a[" k3s_server_post : Extract Cilium CLI to /usr/local/bin"]
									style task_2c21c59a stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_2c21c59a
									linkStyle 99 stroke:#5e7359,color:#5e7359
									task_981d0c3b[" k3s_server_post : Remove downloaded tarball and checksum file"]
									style task_981d0c3b stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_981d0c3b
									linkStyle 100 stroke:#5e7359,color:#5e7359
									task_dec4a960[" k3s_server_post : Wait for connectivity to kube VIP"]
									style task_dec4a960 stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_dec4a960
									linkStyle 101 stroke:#5e7359,color:#5e7359
									task_f7c75486[" k3s_server_post : Fail if kube VIP not reachable"]
									style task_f7c75486 stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and ping_result.rc != 0]"| task_f7c75486
									linkStyle 102 stroke:#5e7359,color:#5e7359
									task_cb033d75[" k3s_server_post : Test for existing Cilium install"]
									style task_cb033d75 stroke:#5e7359,fill:#ffffff
									block_fe378479 --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_cb033d75
									linkStyle 103 stroke:#5e7359,color:#5e7359
									%% Start of the block 'Check existing Cilium install'
									block_5b1cd695["[block] Check existing Cilium install"]
									style block_5b1cd695 fill:#5e7359,color:#ffffff,stroke:#5e7359
									block_fe378479 --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| block_5b1cd695
									linkStyle 104 stroke:#5e7359,color:#5e7359
									subgraph subgraph_block_5b1cd695["Check existing Cilium install "]
										task_1a591172[" k3s_server_post : Check Cilium version"]
										style task_1a591172 stroke:#5e7359,fill:#ffffff
										block_5b1cd695 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_1a591172
										linkStyle 105 stroke:#5e7359,color:#5e7359
										task_4032e6a9[" k3s_server_post : Parse installed Cilium version"]
										style task_4032e6a9 stroke:#5e7359,fill:#ffffff
										block_5b1cd695 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_4032e6a9
										linkStyle 106 stroke:#5e7359,color:#5e7359
										task_80d1246b[" k3s_server_post : Determine if Cilium needs update"]
										style task_80d1246b stroke:#5e7359,fill:#ffffff
										block_5b1cd695 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_80d1246b
										linkStyle 107 stroke:#5e7359,color:#5e7359
										task_95406c16[" k3s_server_post : Log result"]
										style task_95406c16 stroke:#5e7359,fill:#ffffff
										block_5b1cd695 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_95406c16
										linkStyle 108 stroke:#5e7359,color:#5e7359
										task_d2a98882[" k3s_server_post : Install Cilium"]
										style task_d2a98882 stroke:#5e7359,fill:#ffffff
										block_5b1cd695 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc != 0 or cilium_needs_update]"| task_d2a98882
										linkStyle 109 stroke:#5e7359,color:#5e7359
										task_9e449ea6[" k3s_server_post : Wait for Cilium resources"]
										style task_9e449ea6 stroke:#5e7359,fill:#ffffff
										block_5b1cd695 --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and not item.check_hubble | default(false) or (item.check_hubble | default(false) and cilium_hubble)]"| task_9e449ea6
										linkStyle 110 stroke:#5e7359,color:#5e7359
										%% Start of the block 'Configure Cilium BGP'
										block_16e4c7d6["[block] Configure Cilium BGP"]
										style block_16e4c7d6 fill:#5e7359,color:#ffffff,stroke:#5e7359
										block_5b1cd695 --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| block_16e4c7d6
										linkStyle 111 stroke:#5e7359,color:#5e7359
										subgraph subgraph_block_16e4c7d6["Configure Cilium BGP "]
											task_dc20ed64[" k3s_server_post : Set _cilium_bgp_neighbors fact"]
											style task_dc20ed64 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_dc20ed64
											linkStyle 112 stroke:#5e7359,color:#5e7359
											task_f9f76eac[" k3s_server_post : Copy BGP manifests to first master"]
											style task_f9f76eac stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_f9f76eac
											linkStyle 113 stroke:#5e7359,color:#5e7359
											task_d5d9519e[" k3s_server_post : Apply BGP manifests"]
											style task_d5d9519e stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_d5d9519e
											linkStyle 114 stroke:#5e7359,color:#5e7359
											task_9963b958[" k3s_server_post : Print error message if BGP manifests application fails"]
											style task_9963b958 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp and 'is invalid' in apply_cr.stderr]"| task_9963b958
											linkStyle 115 stroke:#5e7359,color:#5e7359
											task_27b185d7[" k3s_server_post : Test for BGP config resources"]
											style task_27b185d7 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_27b185d7
											linkStyle 116 stroke:#5e7359,color:#5e7359
											task_18a23946[" k3s_server_post : Create manifests directory for temp configuration"]
											style task_18a23946 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"6"| task_18a23946
											linkStyle 117 stroke:#5e7359,color:#5e7359
											task_8f8f2a51[" k3s_server_post : Delete outdated metallb replicas"]
											style task_8f8f2a51 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"7"| task_8f8f2a51
											linkStyle 118 stroke:#5e7359,color:#5e7359
											task_88a5be52[" k3s_server_post : Copy metallb CRs manifest to first master"]
											style task_88a5be52 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"8"| task_88a5be52
											linkStyle 119 stroke:#5e7359,color:#5e7359
											task_43c95ee6[" k3s_server_post : Test metallb-system namespace"]
											style task_43c95ee6 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"9"| task_43c95ee6
											linkStyle 120 stroke:#5e7359,color:#5e7359
											task_9defda54[" k3s_server_post : Wait for MetalLB resources"]
											style task_9defda54 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"10"| task_9defda54
											linkStyle 121 stroke:#5e7359,color:#5e7359
											task_0a7565f8[" k3s_server_post : Set metallb webhook service name"]
											style task_0a7565f8 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"11"| task_0a7565f8
											linkStyle 122 stroke:#5e7359,color:#5e7359
											task_376b7d8a[" k3s_server_post : Test metallb-system webhook-service endpoint"]
											style task_376b7d8a stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"12"| task_376b7d8a
											linkStyle 123 stroke:#5e7359,color:#5e7359
											task_b3c60d38[" k3s_server_post : Apply metallb CRs"]
											style task_b3c60d38 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"13"| task_b3c60d38
											linkStyle 124 stroke:#5e7359,color:#5e7359
											task_693365b3[" k3s_server_post : Test metallb-system resources for Layer 2 configuration"]
											style task_693365b3 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"14 [when: metal_lb_mode == 'layer2']"| task_693365b3
											linkStyle 125 stroke:#5e7359,color:#5e7359
											task_ef6982c4[" k3s_server_post : Test metallb-system resources for BGP configuration"]
											style task_ef6982c4 stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"15 [when: metal_lb_mode == 'bgp']"| task_ef6982c4
											linkStyle 126 stroke:#5e7359,color:#5e7359
											task_0a2f5abb[" k3s_server_post : Remove tmp directory used for manifests"]
											style task_0a2f5abb stroke:#5e7359,fill:#ffffff
											block_16e4c7d6 --> |"16"| task_0a2f5abb
											linkStyle 127 stroke:#5e7359,color:#5e7359
										end
										%% End of the block 'Configure Cilium BGP'
									end
									%% End of the block 'Check existing Cilium install'
								end
								%% End of the block 'Install or update Cilium CLI'
							end
							%% End of the block 'Prepare Cilium CLI on first master and deploy CNI'
						end
						%% End of the block 'Deploy Calico custom resources'
					end
					%% End of the block 'Deploy or replace Tigera Operator'
				end
				%% End of the block 'Deploy Calico to cluster'
			%% End of the role 'k3s_server_post'
		%% End of the play 'Play: Configure k3s cluster (1)'
		%% Start of the play 'Play: Storing kubeconfig in the playbook directory (1)'
		play_2202664e["Play: Storing kubeconfig in the playbook directory (1)"]
		style play_2202664e fill:#a1672b,color:#ffffff
		playbook_1bf0791a --> |"7"| play_2202664e
		linkStyle 128 stroke:#a1672b,color:#a1672b
			task_a3be7eae["[task]  Copying kubeconfig from {{ hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] }}"]
			style task_a3be7eae stroke:#a1672b,fill:#ffffff
			play_2202664e --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_a3be7eae
			linkStyle 129 stroke:#a1672b,color:#a1672b
		%% End of the play 'Play: Storing kubeconfig in the playbook directory (1)'
	%% End of the playbook 'SAE503/k3s-ansible/site.yml'

```

```mermaid
---
title: Ansible Playbook Graph
---
%%{ init: { "flowchart": { "curve": "bumpX" } } }%%
flowchart LR
	%% Start of the playbook '/Users/blt/Documents/Github/perso/SAE503/k3s-ansible/site.yml'
	playbook_3584e271("/Users/blt/Documents/Github/perso/SAE503/k3s-ansible/site.yml")
		%% Start of the play 'Play: Pre tasks (3)'
		play_c08043d7["Play: Pre tasks (3)"]
		style play_c08043d7 fill:#6e4e7e,color:#ffffff
		playbook_3584e271 --> |"1"| play_c08043d7
		linkStyle 0 stroke:#6e4e7e,color:#6e4e7e
			pre_task_0c6728a1["[pre_task]  Verify Ansible is version 2.11 or above. (If this fails you may need to update Ansible)"]
			style pre_task_0c6728a1 stroke:#6e4e7e,fill:#ffffff
			play_c08043d7 --> |"1"| pre_task_0c6728a1
			linkStyle 1 stroke:#6e4e7e,color:#6e4e7e
		%% End of the play 'Play: Pre tasks (3)'
		%% Start of the play 'Play: Prepare k3s nodes (3)'
		play_7df6d726["Play: Prepare k3s nodes (3)"]
		style play_7df6d726 fill:#9a3294,color:#ffffff
		playbook_3584e271 --> |"3"| play_7df6d726
		linkStyle 2 stroke:#9a3294,color:#9a3294
			%% Start of the role 'prereq'
			play_7df6d726 --> |"1"| role_c540ed44
			linkStyle 3 stroke:#9a3294,color:#9a3294
			role_c540ed44(["[role] prereq"])
			style role_c540ed44 fill:#9a3294,color:#ffffff,stroke:#9a3294
				task_d0157b24[" prereq : Validating arguments against arg spec 'main' - Prerequisites"]
				style task_d0157b24 stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"1"| task_d0157b24
				linkStyle 4 stroke:#9a3294,color:#9a3294
				task_5845b34d[" prereq : Set same timezone on every Server"]
				style task_5845b34d stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"2 [when: (system_timezone is defined) and (system_timezone != 'Your/Timezone')]"| task_5845b34d
				linkStyle 5 stroke:#9a3294,color:#9a3294
				task_b79b41e5[" prereq : Set SELinux to disabled state"]
				style task_b79b41e5 stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"3 [when: ansible_os_family == 'RedHat']"| task_b79b41e5
				linkStyle 6 stroke:#9a3294,color:#9a3294
				task_7fb91e14[" prereq : Enable IPv4 forwarding"]
				style task_7fb91e14 stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"4"| task_7fb91e14
				linkStyle 7 stroke:#9a3294,color:#9a3294
				task_a19bbe2d[" prereq : Enable IPv6 forwarding"]
				style task_a19bbe2d stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"5"| task_a19bbe2d
				linkStyle 8 stroke:#9a3294,color:#9a3294
				task_5d1bcfea[" prereq : Enable IPv6 router advertisements"]
				style task_5d1bcfea stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"6"| task_5d1bcfea
				linkStyle 9 stroke:#9a3294,color:#9a3294
				task_704d7335[" prereq : Add br_netfilter to /etc/modules-load.d/"]
				style task_704d7335 stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"7 [when: ansible_os_family == 'RedHat']"| task_704d7335
				linkStyle 10 stroke:#9a3294,color:#9a3294
				task_6572c702[" prereq : Load br_netfilter"]
				style task_6572c702 stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"8 [when: ansible_os_family == 'RedHat']"| task_6572c702
				linkStyle 11 stroke:#9a3294,color:#9a3294
				task_4c0e619c[" prereq : Set bridge-nf-call-iptables (just to be sure)"]
				style task_4c0e619c stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"9 [when: ansible_os_family == 'RedHat']"| task_4c0e619c
				linkStyle 12 stroke:#9a3294,color:#9a3294
				task_2fd2bc98[" prereq : Add /usr/local/bin to sudo secure_path"]
				style task_2fd2bc98 stroke:#9a3294,fill:#ffffff
				role_c540ed44 --> |"10 [when: ansible_os_family in [ 'RedHat', 'Suse' ]]"| task_2fd2bc98
				linkStyle 13 stroke:#9a3294,color:#9a3294
			%% End of the role 'prereq'
			%% Start of the role 'download'
			play_7df6d726 --> |"2"| role_590d3d50
			linkStyle 14 stroke:#9a3294,color:#9a3294
			role_590d3d50(["[role] download"])
			style role_590d3d50 fill:#9a3294,color:#ffffff,stroke:#9a3294
				task_ab706a42[" download : Validating arguments against arg spec 'main' - Manage the downloading of K3S binaries"]
				style task_ab706a42 stroke:#9a3294,fill:#ffffff
				role_590d3d50 --> |"1"| task_ab706a42
				linkStyle 15 stroke:#9a3294,color:#9a3294
				task_9394fd79[" download : Download k3s binary x64"]
				style task_9394fd79 stroke:#9a3294,fill:#ffffff
				role_590d3d50 --> |"2 [when: ansible_facts.architecture == 'x86_64']"| task_9394fd79
				linkStyle 16 stroke:#9a3294,color:#9a3294
				task_7912916d[" download : Download k3s binary arm64"]
				style task_7912916d stroke:#9a3294,fill:#ffffff
				role_590d3d50 --> |"3 [when: ( ansible_facts.architecture is search('arm') and ansible_facts.userspace_bits == '64' ) or ansible_facts.architecture is search('aarch64')]"| task_7912916d
				linkStyle 17 stroke:#9a3294,color:#9a3294
				task_36ce414c[" download : Download k3s binary armhf"]
				style task_36ce414c stroke:#9a3294,fill:#ffffff
				role_590d3d50 --> |"4 [when: ansible_facts.architecture is search('arm') and ansible_facts.userspace_bits == '32']"| task_36ce414c
				linkStyle 18 stroke:#9a3294,color:#9a3294
			%% End of the role 'download'
			%% Start of the role 'k3s_custom_registries'
			play_7df6d726 --> |"3"| role_9bcaa5af
			linkStyle 19 stroke:#9a3294,color:#9a3294
			role_9bcaa5af(["[role] k3s_custom_registries"])
			style role_9bcaa5af fill:#9a3294,color:#ffffff,stroke:#9a3294
				task_564a335c[" k3s_custom_registries : Validating arguments against arg spec 'main' - Configure the use of a custom container registry"]
				style task_564a335c stroke:#9a3294,fill:#ffffff
				role_9bcaa5af --> |"1 [when: custom_registries]"| task_564a335c
				linkStyle 20 stroke:#9a3294,color:#9a3294
				task_6c3bdfe1[" k3s_custom_registries : Create directory /etc/rancher/k3s"]
				style task_6c3bdfe1 stroke:#9a3294,fill:#ffffff
				role_9bcaa5af --> |"2 [when: custom_registries]"| task_6c3bdfe1
				linkStyle 21 stroke:#9a3294,color:#9a3294
				task_2ac64014[" k3s_custom_registries : Insert registries into /etc/rancher/k3s/registries.yaml"]
				style task_2ac64014 stroke:#9a3294,fill:#ffffff
				role_9bcaa5af --> |"3 [when: custom_registries]"| task_2ac64014
				linkStyle 22 stroke:#9a3294,color:#9a3294
			%% End of the role 'k3s_custom_registries'
		%% End of the play 'Play: Prepare k3s nodes (3)'
		%% Start of the play 'Play: Setup k3s servers (1)'
		play_cd5dbbbd["Play: Setup k3s servers (1)"]
		style play_cd5dbbbd fill:#7ea725,color:#ffffff
		playbook_3584e271 --> |"4"| play_cd5dbbbd
		linkStyle 23 stroke:#7ea725,color:#7ea725
			%% Start of the role 'k3s_server'
			play_cd5dbbbd --> |"1"| role_e5688656
			linkStyle 24 stroke:#7ea725,color:#7ea725
			role_e5688656(["[role] k3s_server"])
			style role_e5688656 fill:#7ea725,color:#ffffff,stroke:#7ea725
				task_06809810[" k3s_server : Validating arguments against arg spec 'main' - Setup k3s servers"]
				style task_06809810 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"1"| task_06809810
				linkStyle 25 stroke:#7ea725,color:#7ea725
				task_823c41f0[" k3s_server : Stop k3s-init"]
				style task_823c41f0 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"2"| task_823c41f0
				linkStyle 26 stroke:#7ea725,color:#7ea725
				task_2057b388[" k3s_server : Stop k3s"]
				style task_2057b388 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"3"| task_2057b388
				linkStyle 27 stroke:#7ea725,color:#7ea725
				task_94502945[" k3s_server : Clean previous runs of k3s-init"]
				style task_94502945 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"4"| task_94502945
				linkStyle 28 stroke:#7ea725,color:#7ea725
				task_1fd58706[" k3s_server : Create k3s.service.d directory"]
				style task_1fd58706 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"5"| task_1fd58706
				linkStyle 29 stroke:#7ea725,color:#7ea725
				task_b7e4ef26[" k3s_server : Copy K3s http_proxy conf file"]
				style task_b7e4ef26 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"6"| task_b7e4ef26
				linkStyle 30 stroke:#7ea725,color:#7ea725
				task_c3fec24c[" k3s_server : Set _kube_vip_bgp_peers fact"]
				style task_c3fec24c stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"7"| task_c3fec24c
				linkStyle 31 stroke:#7ea725,color:#7ea725
				task_025ae409[" k3s_server : Create manifests directory on first master"]
				style task_025ae409 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_025ae409
				linkStyle 32 stroke:#7ea725,color:#7ea725
				task_7650a111[" k3s_server : Download vip rbac manifest to first master"]
				style task_7650a111 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_7650a111
				linkStyle 33 stroke:#7ea725,color:#7ea725
				task_5d6d04fd[" k3s_server : Copy vip manifest to first master"]
				style task_5d6d04fd stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"10 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_5d6d04fd
				linkStyle 34 stroke:#7ea725,color:#7ea725
				task_9a11e1f5[" k3s_server : Create manifests directory on first master"]
				style task_9a11e1f5 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"11 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_9a11e1f5
				linkStyle 35 stroke:#7ea725,color:#7ea725
				task_2d7b0f3a[" k3s_server : Download to first master: manifest for metallb-native"]
				style task_2d7b0f3a stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"12 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_2d7b0f3a
				linkStyle 36 stroke:#7ea725,color:#7ea725
				task_b2f18af6[" k3s_server : Set image versions in manifest for metallb-native"]
				style task_b2f18af6 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"13 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_b2f18af6
				linkStyle 37 stroke:#7ea725,color:#7ea725
				task_a37af1ec[" k3s_server : Create manifests directory on first master"]
				style task_a37af1ec stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"14 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_a37af1ec
				linkStyle 38 stroke:#7ea725,color:#7ea725
				task_ce3c2eb1[" k3s_server : Download vip cloud provider manifest to first master"]
				style task_ce3c2eb1 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"15 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_ce3c2eb1
				linkStyle 39 stroke:#7ea725,color:#7ea725
				task_e6558f9a[" k3s_server : Copy kubevip configMap manifest to first master"]
				style task_e6558f9a stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"16 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_e6558f9a
				linkStyle 40 stroke:#7ea725,color:#7ea725
				task_799aa4ad[" k3s_server : Init cluster inside the transient k3s-init service"]
				style task_799aa4ad stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"17"| task_799aa4ad
				linkStyle 41 stroke:#7ea725,color:#7ea725
				%% Start of the block 'Verification'
				block_0c1fb9d5["[block] Verification"]
				style block_0c1fb9d5 fill:#7ea725,color:#ffffff,stroke:#7ea725
				role_e5688656 --> |"18 [when: not ansible_check_mode]"| block_0c1fb9d5
				linkStyle 42 stroke:#7ea725,color:#7ea725
				subgraph subgraph_block_0c1fb9d5["Verification "]
					task_92804d84[" k3s_server : Verify that all nodes actually joined (check k3s-init.service if this fails)"]
					style task_92804d84 stroke:#7ea725,fill:#ffffff
					block_0c1fb9d5 --> |"1 [when: not ansible_check_mode]"| task_92804d84
					linkStyle 43 stroke:#7ea725,color:#7ea725
				end
				%% End of the block 'Verification'
				task_4520b642[" k3s_server : Copy K3s service file"]
				style task_4520b642 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"19"| task_4520b642
				linkStyle 44 stroke:#7ea725,color:#7ea725
				task_e25e874f[" k3s_server : Enable and check K3s service"]
				style task_e25e874f stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"20"| task_e25e874f
				linkStyle 45 stroke:#7ea725,color:#7ea725
				task_c2aa36b6[" k3s_server : Wait for node-token"]
				style task_c2aa36b6 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"21"| task_c2aa36b6
				linkStyle 46 stroke:#7ea725,color:#7ea725
				task_3544a191[" k3s_server : Register node-token file access mode"]
				style task_3544a191 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"22"| task_3544a191
				linkStyle 47 stroke:#7ea725,color:#7ea725
				task_9d2ddf87[" k3s_server : Change file access node-token"]
				style task_9d2ddf87 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"23"| task_9d2ddf87
				linkStyle 48 stroke:#7ea725,color:#7ea725
				task_d6bf9533[" k3s_server : Read node-token from master"]
				style task_d6bf9533 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"24"| task_d6bf9533
				linkStyle 49 stroke:#7ea725,color:#7ea725
				task_0032f180[" k3s_server : Store Master node-token"]
				style task_0032f180 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"25"| task_0032f180
				linkStyle 50 stroke:#7ea725,color:#7ea725
				task_d7f4f7f0[" k3s_server : Restore node-token file access"]
				style task_d7f4f7f0 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"26"| task_d7f4f7f0
				linkStyle 51 stroke:#7ea725,color:#7ea725
				task_2c57f31d[" k3s_server : Create directory .kube"]
				style task_2c57f31d stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"27"| task_2c57f31d
				linkStyle 52 stroke:#7ea725,color:#7ea725
				task_13133b66[" k3s_server : Copy config file to user home directory"]
				style task_13133b66 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"28"| task_13133b66
				linkStyle 53 stroke:#7ea725,color:#7ea725
				task_150cf62a[" k3s_server : Configure kubectl cluster to {{ endpoint_url }}"]
				style task_150cf62a stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"29"| task_150cf62a
				linkStyle 54 stroke:#7ea725,color:#7ea725
				task_0c880781[" k3s_server : Create kubectl symlink"]
				style task_0c880781 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"30 [when: k3s_create_kubectl_symlink | default(true) | bool]"| task_0c880781
				linkStyle 55 stroke:#7ea725,color:#7ea725
				task_47f1e12c[" k3s_server : Create crictl symlink"]
				style task_47f1e12c stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"31 [when: k3s_create_crictl_symlink | default(true) | bool]"| task_47f1e12c
				linkStyle 56 stroke:#7ea725,color:#7ea725
				task_9540d59a[" k3s_server : Get contents of manifests folder"]
				style task_9540d59a stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"32"| task_9540d59a
				linkStyle 57 stroke:#7ea725,color:#7ea725
				task_58420823[" k3s_server : Get sub dirs of manifests folder"]
				style task_58420823 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"33"| task_58420823
				linkStyle 58 stroke:#7ea725,color:#7ea725
				task_0e6c0214[" k3s_server : Remove manifests and folders that are only needed for bootstrapping cluster so k3s doesn't auto apply on start"]
				style task_0e6c0214 stroke:#7ea725,fill:#ffffff
				role_e5688656 --> |"34"| task_0e6c0214
				linkStyle 59 stroke:#7ea725,color:#7ea725
			%% End of the role 'k3s_server'
		%% End of the play 'Play: Setup k3s servers (1)'
		%% Start of the play 'Play: Setup k3s agents (2)'
		play_403f7c34["Play: Setup k3s agents (2)"]
		style play_403f7c34 fill:#2e9e9b,color:#ffffff
		playbook_3584e271 --> |"5"| play_403f7c34
		linkStyle 60 stroke:#2e9e9b,color:#2e9e9b
			%% Start of the role 'k3s_agent'
			play_403f7c34 --> |"1"| role_92382942
			linkStyle 61 stroke:#2e9e9b,color:#2e9e9b
			role_92382942(["[role] k3s_agent"])
			style role_92382942 fill:#2e9e9b,color:#ffffff,stroke:#2e9e9b
				task_566ce507[" k3s_agent : Validating arguments against arg spec 'main' - Setup k3s agents"]
				style task_566ce507 stroke:#2e9e9b,fill:#ffffff
				role_92382942 --> |"1"| task_566ce507
				linkStyle 62 stroke:#2e9e9b,color:#2e9e9b
				%% Start of the block 'Check for PXE-booted system'
				block_635f4d4c["[block] Check for PXE-booted system"]
				style block_635f4d4c fill:#2e9e9b,color:#ffffff,stroke:#2e9e9b
				role_92382942 --> |"2"| block_635f4d4c
				linkStyle 63 stroke:#2e9e9b,color:#2e9e9b
				subgraph subgraph_block_635f4d4c["Check for PXE-booted system "]
					task_26c596a5[" k3s_agent : Check if system is PXE-booted"]
					style task_26c596a5 stroke:#2e9e9b,fill:#ffffff
					block_635f4d4c --> |"1"| task_26c596a5
					linkStyle 64 stroke:#2e9e9b,color:#2e9e9b
					task_98f608fb[" k3s_agent : Set fact for PXE-booted system"]
					style task_98f608fb stroke:#2e9e9b,fill:#ffffff
					block_635f4d4c --> |"2 [when: boot_cmdline.stdout is defined]"| task_98f608fb
					linkStyle 65 stroke:#2e9e9b,color:#2e9e9b
					task_090e88e6[" k3s_agent : Create k3s-node.service.d directory"]
					style task_090e88e6 stroke:#2e9e9b,fill:#ffffff
					block_635f4d4c --> |"3 [when: proxy_env is defined]"| task_090e88e6
					linkStyle 66 stroke:#2e9e9b,color:#2e9e9b
					task_bb8e8c8c[" k3s_agent : Copy K3s http_proxy conf file"]
					style task_bb8e8c8c stroke:#2e9e9b,fill:#ffffff
					block_635f4d4c --> |"4 [when: proxy_env is defined]"| task_bb8e8c8c
					linkStyle 67 stroke:#2e9e9b,color:#2e9e9b
				end
				%% End of the block 'Check for PXE-booted system'
				task_33fd61af[" k3s_agent : Create k3s-node.service.d directory"]
				style task_33fd61af stroke:#2e9e9b,fill:#ffffff
				role_92382942 --> |"3 [when: proxy_env is defined]"| task_33fd61af
				linkStyle 68 stroke:#2e9e9b,color:#2e9e9b
				task_945c365d[" k3s_agent : Copy K3s http_proxy conf file"]
				style task_945c365d stroke:#2e9e9b,fill:#ffffff
				role_92382942 --> |"4 [when: proxy_env is defined]"| task_945c365d
				linkStyle 69 stroke:#2e9e9b,color:#2e9e9b
				task_9d91e446[" k3s_agent : Configure the k3s service"]
				style task_9d91e446 stroke:#2e9e9b,fill:#ffffff
				role_92382942 --> |"5"| task_9d91e446
				linkStyle 70 stroke:#2e9e9b,color:#2e9e9b
				task_9278568b[" k3s_agent : Manage k3s service"]
				style task_9278568b stroke:#2e9e9b,fill:#ffffff
				role_92382942 --> |"6"| task_9278568b
				linkStyle 71 stroke:#2e9e9b,color:#2e9e9b
			%% End of the role 'k3s_agent'
		%% End of the play 'Play: Setup k3s agents (2)'
		%% Start of the play 'Play: Configure k3s cluster (1)'
		play_a812915f["Play: Configure k3s cluster (1)"]
		style play_a812915f fill:#455f87,color:#ffffff
		playbook_3584e271 --> |"6"| play_a812915f
		linkStyle 72 stroke:#455f87,color:#455f87
			%% Start of the role 'k3s_server_post'
			play_a812915f --> |"1"| role_ce2d1e17
			linkStyle 73 stroke:#455f87,color:#455f87
			role_ce2d1e17(["[role] k3s_server_post"])
			style role_ce2d1e17 fill:#455f87,color:#ffffff,stroke:#455f87
				task_57d2551f[" k3s_server_post : Validating arguments against arg spec 'main' - Configure k3s cluster"]
				style task_57d2551f stroke:#455f87,fill:#ffffff
				role_ce2d1e17 --> |"1"| task_57d2551f
				linkStyle 74 stroke:#455f87,color:#455f87
				%% Start of the block 'Deploy Calico to cluster'
				block_7b072dcc["[block] Deploy Calico to cluster"]
				style block_7b072dcc fill:#455f87,color:#ffffff,stroke:#455f87
				role_ce2d1e17 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_7b072dcc
				linkStyle 75 stroke:#455f87,color:#455f87
				subgraph subgraph_block_7b072dcc["Deploy Calico to cluster "]
					task_26467fbc[" k3s_server_post : Create manifests directory on first master"]
					style task_26467fbc stroke:#455f87,fill:#ffffff
					block_7b072dcc --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_26467fbc
					linkStyle 76 stroke:#455f87,color:#455f87
					task_982d0573[" k3s_server_post : Download to first master: manifest for Tigera Operator and Calico CRDs"]
					style task_982d0573 stroke:#455f87,fill:#ffffff
					block_7b072dcc --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_982d0573
					linkStyle 77 stroke:#455f87,color:#455f87
					task_19b113ff[" k3s_server_post : Copy Calico custom resources manifest to first master"]
					style task_19b113ff stroke:#455f87,fill:#ffffff
					block_7b072dcc --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_19b113ff
					linkStyle 78 stroke:#455f87,color:#455f87
					%% Start of the block 'Deploy or replace Tigera Operator'
					block_d3a42f4c["[block] Deploy or replace Tigera Operator"]
					style block_d3a42f4c fill:#455f87,color:#ffffff,stroke:#455f87
					block_7b072dcc --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_d3a42f4c
					linkStyle 79 stroke:#455f87,color:#455f87
					subgraph subgraph_block_d3a42f4c["Deploy or replace Tigera Operator "]
						task_156d53ea[" k3s_server_post : Deploy Tigera Operator"]
						style task_156d53ea stroke:#455f87,fill:#ffffff
						block_d3a42f4c --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_156d53ea
						linkStyle 80 stroke:#455f87,color:#455f87
						task_9f5e1fe7[" k3s_server_post : Wait for Tigera Operator resources"]
						style task_9f5e1fe7 stroke:#455f87,fill:#ffffff
						block_d3a42f4c --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_9f5e1fe7
						linkStyle 81 stroke:#455f87,color:#455f87
						%% Start of the block 'Deploy Calico custom resources'
						block_d7254a11["[block] Deploy Calico custom resources"]
						style block_d7254a11 fill:#455f87,color:#ffffff,stroke:#455f87
						block_d3a42f4c --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_d7254a11
						linkStyle 82 stroke:#455f87,color:#455f87
						subgraph subgraph_block_d7254a11["Deploy Calico custom resources "]
							task_2fa62e13[" k3s_server_post : Deploy custom resources for Calico"]
							style task_2fa62e13 stroke:#455f87,fill:#ffffff
							block_d7254a11 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_2fa62e13
							linkStyle 83 stroke:#455f87,color:#455f87
							task_10dc281e[" k3s_server_post : Wait for Calico system resources to be available"]
							style task_10dc281e stroke:#455f87,fill:#ffffff
							block_d7254a11 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_10dc281e
							linkStyle 84 stroke:#455f87,color:#455f87
							task_1f42d55a[" k3s_server_post : Patch Felix configuration for eBPF mode"]
							style task_1f42d55a stroke:#455f87,fill:#ffffff
							block_d7254a11 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and calico_ebpf]"| task_1f42d55a
							linkStyle 85 stroke:#455f87,color:#455f87
							%% Start of the block 'Prepare Cilium CLI on first master and deploy CNI'
							block_9fc6ee29["[block] Prepare Cilium CLI on first master and deploy CNI"]
							style block_9fc6ee29 fill:#455f87,color:#ffffff,stroke:#455f87
							block_d7254a11 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_9fc6ee29
							linkStyle 86 stroke:#455f87,color:#455f87
							subgraph subgraph_block_9fc6ee29["Prepare Cilium CLI on first master and deploy CNI "]
								task_e6e89969[" k3s_server_post : Create tmp directory on first master"]
								style task_e6e89969 stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_e6e89969
								linkStyle 87 stroke:#455f87,color:#455f87
								task_e91093c0[" k3s_server_post : Check if Cilium CLI is installed"]
								style task_e91093c0 stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_e91093c0
								linkStyle 88 stroke:#455f87,color:#455f87
								task_59ba4b61[" k3s_server_post : Check for Cilium CLI version in command output"]
								style task_59ba4b61 stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_installed.rc == 0]"| task_59ba4b61
								linkStyle 89 stroke:#455f87,color:#455f87
								task_5fae9892[" k3s_server_post : Get latest stable Cilium CLI version file"]
								style task_5fae9892 stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_5fae9892
								linkStyle 90 stroke:#455f87,color:#455f87
								task_ff8245db[" k3s_server_post : Read Cilium CLI stable version from file"]
								style task_ff8245db stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_ff8245db
								linkStyle 91 stroke:#455f87,color:#455f87
								task_208b6edd[" k3s_server_post : Log installed Cilium CLI version"]
								style task_208b6edd stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_208b6edd
								linkStyle 92 stroke:#455f87,color:#455f87
								task_d31f5217[" k3s_server_post : Log latest stable Cilium CLI version"]
								style task_d31f5217 stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_d31f5217
								linkStyle 93 stroke:#455f87,color:#455f87
								task_29a3b8b6[" k3s_server_post : Determine if Cilium CLI needs installation or update"]
								style task_29a3b8b6 stroke:#455f87,fill:#ffffff
								block_9fc6ee29 --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_29a3b8b6
								linkStyle 94 stroke:#455f87,color:#455f87
								%% Start of the block 'Install or update Cilium CLI'
								block_88212c7c["[block] Install or update Cilium CLI"]
								style block_88212c7c fill:#455f87,color:#ffffff,stroke:#455f87
								block_9fc6ee29 --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| block_88212c7c
								linkStyle 95 stroke:#455f87,color:#455f87
								subgraph subgraph_block_88212c7c["Install or update Cilium CLI "]
									task_81480f0e[" k3s_server_post : Set architecture variable"]
									style task_81480f0e stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_81480f0e
									linkStyle 96 stroke:#455f87,color:#455f87
									task_5ef920b9[" k3s_server_post : Download Cilium CLI and checksum"]
									style task_5ef920b9 stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_5ef920b9
									linkStyle 97 stroke:#455f87,color:#455f87
									task_a8a6aa29[" k3s_server_post : Verify the downloaded tarball"]
									style task_a8a6aa29 stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_a8a6aa29
									linkStyle 98 stroke:#455f87,color:#455f87
									task_f63eb3a3[" k3s_server_post : Extract Cilium CLI to /usr/local/bin"]
									style task_f63eb3a3 stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_f63eb3a3
									linkStyle 99 stroke:#455f87,color:#455f87
									task_280e52b9[" k3s_server_post : Remove downloaded tarball and checksum file"]
									style task_280e52b9 stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_280e52b9
									linkStyle 100 stroke:#455f87,color:#455f87
									task_1c83286e[" k3s_server_post : Wait for connectivity to kube VIP"]
									style task_1c83286e stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_1c83286e
									linkStyle 101 stroke:#455f87,color:#455f87
									task_b7c55824[" k3s_server_post : Fail if kube VIP not reachable"]
									style task_b7c55824 stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and ping_result.rc != 0]"| task_b7c55824
									linkStyle 102 stroke:#455f87,color:#455f87
									task_963e9c34[" k3s_server_post : Test for existing Cilium install"]
									style task_963e9c34 stroke:#455f87,fill:#ffffff
									block_88212c7c --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_963e9c34
									linkStyle 103 stroke:#455f87,color:#455f87
									%% Start of the block 'Check existing Cilium install'
									block_a43969ef["[block] Check existing Cilium install"]
									style block_a43969ef fill:#455f87,color:#ffffff,stroke:#455f87
									block_88212c7c --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| block_a43969ef
									linkStyle 104 stroke:#455f87,color:#455f87
									subgraph subgraph_block_a43969ef["Check existing Cilium install "]
										task_d74b4c34[" k3s_server_post : Check Cilium version"]
										style task_d74b4c34 stroke:#455f87,fill:#ffffff
										block_a43969ef --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_d74b4c34
										linkStyle 105 stroke:#455f87,color:#455f87
										task_1cc8b253[" k3s_server_post : Parse installed Cilium version"]
										style task_1cc8b253 stroke:#455f87,fill:#ffffff
										block_a43969ef --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_1cc8b253
										linkStyle 106 stroke:#455f87,color:#455f87
										task_0287309b[" k3s_server_post : Determine if Cilium needs update"]
										style task_0287309b stroke:#455f87,fill:#ffffff
										block_a43969ef --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_0287309b
										linkStyle 107 stroke:#455f87,color:#455f87
										task_654e82bb[" k3s_server_post : Log result"]
										style task_654e82bb stroke:#455f87,fill:#ffffff
										block_a43969ef --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_654e82bb
										linkStyle 108 stroke:#455f87,color:#455f87
										task_8b04b508[" k3s_server_post : Install Cilium"]
										style task_8b04b508 stroke:#455f87,fill:#ffffff
										block_a43969ef --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc != 0 or cilium_needs_update]"| task_8b04b508
										linkStyle 109 stroke:#455f87,color:#455f87
										task_2a7e62e7[" k3s_server_post : Wait for Cilium resources"]
										style task_2a7e62e7 stroke:#455f87,fill:#ffffff
										block_a43969ef --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and not item.check_hubble | default(false) or (item.check_hubble | default(false) and cilium_hubble)]"| task_2a7e62e7
										linkStyle 110 stroke:#455f87,color:#455f87
										%% Start of the block 'Configure Cilium BGP'
										block_0870ab11["[block] Configure Cilium BGP"]
										style block_0870ab11 fill:#455f87,color:#ffffff,stroke:#455f87
										block_a43969ef --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| block_0870ab11
										linkStyle 111 stroke:#455f87,color:#455f87
										subgraph subgraph_block_0870ab11["Configure Cilium BGP "]
											task_4c84a3e6[" k3s_server_post : Set _cilium_bgp_neighbors fact"]
											style task_4c84a3e6 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_4c84a3e6
											linkStyle 112 stroke:#455f87,color:#455f87
											task_4e218d0a[" k3s_server_post : Copy BGP manifests to first master"]
											style task_4e218d0a stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_4e218d0a
											linkStyle 113 stroke:#455f87,color:#455f87
											task_a332cc3a[" k3s_server_post : Apply BGP manifests"]
											style task_a332cc3a stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_a332cc3a
											linkStyle 114 stroke:#455f87,color:#455f87
											task_f27e580e[" k3s_server_post : Print error message if BGP manifests application fails"]
											style task_f27e580e stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp and 'is invalid' in apply_cr.stderr]"| task_f27e580e
											linkStyle 115 stroke:#455f87,color:#455f87
											task_91fd8c43[" k3s_server_post : Test for BGP config resources"]
											style task_91fd8c43 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_91fd8c43
											linkStyle 116 stroke:#455f87,color:#455f87
											task_33504ada[" k3s_server_post : Create manifests directory for temp configuration"]
											style task_33504ada stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"6"| task_33504ada
											linkStyle 117 stroke:#455f87,color:#455f87
											task_77a9ce86[" k3s_server_post : Delete outdated metallb replicas"]
											style task_77a9ce86 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"7"| task_77a9ce86
											linkStyle 118 stroke:#455f87,color:#455f87
											task_6a0648b1[" k3s_server_post : Copy metallb CRs manifest to first master"]
											style task_6a0648b1 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"8"| task_6a0648b1
											linkStyle 119 stroke:#455f87,color:#455f87
											task_f784de96[" k3s_server_post : Test metallb-system namespace"]
											style task_f784de96 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"9"| task_f784de96
											linkStyle 120 stroke:#455f87,color:#455f87
											task_9b76af1c[" k3s_server_post : Wait for MetalLB resources"]
											style task_9b76af1c stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"10"| task_9b76af1c
											linkStyle 121 stroke:#455f87,color:#455f87
											task_32b1c499[" k3s_server_post : Set metallb webhook service name"]
											style task_32b1c499 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"11"| task_32b1c499
											linkStyle 122 stroke:#455f87,color:#455f87
											task_c2c0535f[" k3s_server_post : Test metallb-system webhook-service endpoint"]
											style task_c2c0535f stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"12"| task_c2c0535f
											linkStyle 123 stroke:#455f87,color:#455f87
											task_8652ef84[" k3s_server_post : Apply metallb CRs"]
											style task_8652ef84 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"13"| task_8652ef84
											linkStyle 124 stroke:#455f87,color:#455f87
											task_e2ecdeaf[" k3s_server_post : Test metallb-system resources for Layer 2 configuration"]
											style task_e2ecdeaf stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"14 [when: metal_lb_mode == 'layer2']"| task_e2ecdeaf
											linkStyle 125 stroke:#455f87,color:#455f87
											task_8c7a3799[" k3s_server_post : Test metallb-system resources for BGP configuration"]
											style task_8c7a3799 stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"15 [when: metal_lb_mode == 'bgp']"| task_8c7a3799
											linkStyle 126 stroke:#455f87,color:#455f87
											task_aa6002ee[" k3s_server_post : Remove tmp directory used for manifests"]
											style task_aa6002ee stroke:#455f87,fill:#ffffff
											block_0870ab11 --> |"16"| task_aa6002ee
											linkStyle 127 stroke:#455f87,color:#455f87
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
		play_78365849["Play: Storing kubeconfig in the playbook directory (1)"]
		style play_78365849 fill:#904c3c,color:#ffffff
		playbook_3584e271 --> |"7"| play_78365849
		linkStyle 128 stroke:#904c3c,color:#904c3c
			task_444a8172["[task]  Copying kubeconfig from {{ hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] }}"]
			style task_444a8172 stroke:#904c3c,fill:#ffffff
			play_78365849 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_444a8172
			linkStyle 129 stroke:#904c3c,color:#904c3c
		%% End of the play 'Play: Storing kubeconfig in the playbook directory (1)'
	%% End of the playbook '/Users/blt/Documents/Github/perso/SAE503/k3s-ansible/site.yml'

```

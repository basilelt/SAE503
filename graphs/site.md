```mermaid
---
title: Ansible Playbook Graph
---
%%{ init: { "flowchart": { "curve": "bumpX" } } }%%
flowchart LR
	%% Start of the playbook '/Users/blt/Documents/Github/perso/SAE503/k3s-ansible/site.yml'
	playbook_2f72d199("/Users/blt/Documents/Github/perso/SAE503/k3s-ansible/site.yml")
		%% Start of the play 'Play: Pre tasks (3)'
		play_e83dbb97["Play: Pre tasks (3)"]
		style play_e83dbb97 fill:#1db418,color:#ffffff
		playbook_2f72d199 --> |"1"| play_e83dbb97
		linkStyle 0 stroke:#1db418,color:#1db418
			pre_task_5073b144["[pre_task]  Verify Ansible is version 2.11 or above. (If this fails you may need to update Ansible)"]
			style pre_task_5073b144 stroke:#1db418,fill:#ffffff
			play_e83dbb97 --> |"1"| pre_task_5073b144
			linkStyle 1 stroke:#1db418,color:#1db418
		%% End of the play 'Play: Pre tasks (3)'
		%% Start of the play 'Play: Prepare k3s nodes (3)'
		play_a2c0a2fd["Play: Prepare k3s nodes (3)"]
		style play_a2c0a2fd fill:#9516b6,color:#ffffff
		playbook_2f72d199 --> |"3"| play_a2c0a2fd
		linkStyle 2 stroke:#9516b6,color:#9516b6
			%% Start of the role 'prereq'
			play_a2c0a2fd --> |"1"| role_6c08463b
			linkStyle 3 stroke:#9516b6,color:#9516b6
			role_6c08463b(["[role] prereq"])
			style role_6c08463b fill:#9516b6,color:#ffffff,stroke:#9516b6
				task_037c0ef5[" prereq : Validating arguments against arg spec 'main' - Prerequisites"]
				style task_037c0ef5 stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"1"| task_037c0ef5
				linkStyle 4 stroke:#9516b6,color:#9516b6
				task_5024c6fa[" prereq : Set same timezone on every Server"]
				style task_5024c6fa stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"2 [when: (system_timezone is defined) and (system_timezone != 'Your/Timezone')]"| task_5024c6fa
				linkStyle 5 stroke:#9516b6,color:#9516b6
				task_90adc1ad[" prereq : Set SELinux to disabled state"]
				style task_90adc1ad stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"3 [when: ansible_os_family == 'RedHat']"| task_90adc1ad
				linkStyle 6 stroke:#9516b6,color:#9516b6
				task_be979823[" prereq : Enable IPv4 forwarding"]
				style task_be979823 stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"4"| task_be979823
				linkStyle 7 stroke:#9516b6,color:#9516b6
				task_c97ce22f[" prereq : Enable IPv6 forwarding"]
				style task_c97ce22f stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"5"| task_c97ce22f
				linkStyle 8 stroke:#9516b6,color:#9516b6
				task_aa3d64b2[" prereq : Enable IPv6 router advertisements"]
				style task_aa3d64b2 stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"6"| task_aa3d64b2
				linkStyle 9 stroke:#9516b6,color:#9516b6
				task_f54e243d[" prereq : Add br_netfilter to /etc/modules-load.d/"]
				style task_f54e243d stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"7 [when: ansible_os_family == 'RedHat']"| task_f54e243d
				linkStyle 10 stroke:#9516b6,color:#9516b6
				task_406d2d5e[" prereq : Load br_netfilter"]
				style task_406d2d5e stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"8 [when: ansible_os_family == 'RedHat']"| task_406d2d5e
				linkStyle 11 stroke:#9516b6,color:#9516b6
				task_75daa78a[" prereq : Set bridge-nf-call-iptables (just to be sure)"]
				style task_75daa78a stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"9 [when: ansible_os_family == 'RedHat']"| task_75daa78a
				linkStyle 12 stroke:#9516b6,color:#9516b6
				task_d1221872[" prereq : Add /usr/local/bin to sudo secure_path"]
				style task_d1221872 stroke:#9516b6,fill:#ffffff
				role_6c08463b --> |"10 [when: ansible_os_family in [ 'RedHat', 'Suse' ]]"| task_d1221872
				linkStyle 13 stroke:#9516b6,color:#9516b6
			%% End of the role 'prereq'
			%% Start of the role 'download'
			play_a2c0a2fd --> |"2"| role_7c023365
			linkStyle 14 stroke:#9516b6,color:#9516b6
			role_7c023365(["[role] download"])
			style role_7c023365 fill:#9516b6,color:#ffffff,stroke:#9516b6
				task_3fc2016b[" download : Validating arguments against arg spec 'main' - Manage the downloading of K3S binaries"]
				style task_3fc2016b stroke:#9516b6,fill:#ffffff
				role_7c023365 --> |"1"| task_3fc2016b
				linkStyle 15 stroke:#9516b6,color:#9516b6
				task_95883cd7[" download : Download k3s binary x64"]
				style task_95883cd7 stroke:#9516b6,fill:#ffffff
				role_7c023365 --> |"2 [when: ansible_facts.architecture == 'x86_64']"| task_95883cd7
				linkStyle 16 stroke:#9516b6,color:#9516b6
				task_e5d2cf4a[" download : Download k3s binary arm64"]
				style task_e5d2cf4a stroke:#9516b6,fill:#ffffff
				role_7c023365 --> |"3 [when: ( ansible_facts.architecture is search('arm') and ansible_facts.userspace_bits == '64' ) or ansible_facts.architecture is search('aarch64')]"| task_e5d2cf4a
				linkStyle 17 stroke:#9516b6,color:#9516b6
				task_3da9f384[" download : Download k3s binary armhf"]
				style task_3da9f384 stroke:#9516b6,fill:#ffffff
				role_7c023365 --> |"4 [when: ansible_facts.architecture is search('arm') and ansible_facts.userspace_bits == '32']"| task_3da9f384
				linkStyle 18 stroke:#9516b6,color:#9516b6
			%% End of the role 'download'
			%% Start of the role 'k3s_custom_registries'
			play_a2c0a2fd --> |"3"| role_7c344abc
			linkStyle 19 stroke:#9516b6,color:#9516b6
			role_7c344abc(["[role] k3s_custom_registries"])
			style role_7c344abc fill:#9516b6,color:#ffffff,stroke:#9516b6
				task_61d04c33[" k3s_custom_registries : Validating arguments against arg spec 'main' - Configure the use of a custom container registry"]
				style task_61d04c33 stroke:#9516b6,fill:#ffffff
				role_7c344abc --> |"1 [when: custom_registries]"| task_61d04c33
				linkStyle 20 stroke:#9516b6,color:#9516b6
				task_236c8a56[" k3s_custom_registries : Create directory /etc/rancher/k3s"]
				style task_236c8a56 stroke:#9516b6,fill:#ffffff
				role_7c344abc --> |"2 [when: custom_registries]"| task_236c8a56
				linkStyle 21 stroke:#9516b6,color:#9516b6
				task_7b402999[" k3s_custom_registries : Insert registries into /etc/rancher/k3s/registries.yaml"]
				style task_7b402999 stroke:#9516b6,fill:#ffffff
				role_7c344abc --> |"3 [when: custom_registries]"| task_7b402999
				linkStyle 22 stroke:#9516b6,color:#9516b6
			%% End of the role 'k3s_custom_registries'
		%% End of the play 'Play: Prepare k3s nodes (3)'
		%% Start of the play 'Play: Setup k3s servers (1)'
		play_10607b31["Play: Setup k3s servers (1)"]
		style play_10607b31 fill:#40438c,color:#ffffff
		playbook_2f72d199 --> |"4"| play_10607b31
		linkStyle 23 stroke:#40438c,color:#40438c
			%% Start of the role 'k3s_server'
			play_10607b31 --> |"1"| role_0379e7a1
			linkStyle 24 stroke:#40438c,color:#40438c
			role_0379e7a1(["[role] k3s_server"])
			style role_0379e7a1 fill:#40438c,color:#ffffff,stroke:#40438c
				task_be7b792f[" k3s_server : Validating arguments against arg spec 'main' - Setup k3s servers"]
				style task_be7b792f stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"1"| task_be7b792f
				linkStyle 25 stroke:#40438c,color:#40438c
				task_bd0595ec[" k3s_server : Stop k3s-init"]
				style task_bd0595ec stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"2"| task_bd0595ec
				linkStyle 26 stroke:#40438c,color:#40438c
				task_502638ea[" k3s_server : Stop k3s"]
				style task_502638ea stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"3"| task_502638ea
				linkStyle 27 stroke:#40438c,color:#40438c
				task_1e5c2bb5[" k3s_server : Clean previous runs of k3s-init"]
				style task_1e5c2bb5 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"4"| task_1e5c2bb5
				linkStyle 28 stroke:#40438c,color:#40438c
				task_561dd9f7[" k3s_server : Create k3s.service.d directory"]
				style task_561dd9f7 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"5"| task_561dd9f7
				linkStyle 29 stroke:#40438c,color:#40438c
				task_3ad87266[" k3s_server : Copy K3s http_proxy conf file"]
				style task_3ad87266 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"6"| task_3ad87266
				linkStyle 30 stroke:#40438c,color:#40438c
				task_88deb7b8[" k3s_server : Set _kube_vip_bgp_peers fact"]
				style task_88deb7b8 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"7"| task_88deb7b8
				linkStyle 31 stroke:#40438c,color:#40438c
				task_8e96576f[" k3s_server : Create manifests directory on first master"]
				style task_8e96576f stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_8e96576f
				linkStyle 32 stroke:#40438c,color:#40438c
				task_ef3f5d2b[" k3s_server : Download vip rbac manifest to first master"]
				style task_ef3f5d2b stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_ef3f5d2b
				linkStyle 33 stroke:#40438c,color:#40438c
				task_d216731d[" k3s_server : Copy vip manifest to first master"]
				style task_d216731d stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"10 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_d216731d
				linkStyle 34 stroke:#40438c,color:#40438c
				task_8b9d971e[" k3s_server : Create manifests directory on first master"]
				style task_8b9d971e stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"11 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_8b9d971e
				linkStyle 35 stroke:#40438c,color:#40438c
				task_b727006b[" k3s_server : Download to first master: manifest for metallb-native"]
				style task_b727006b stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"12 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_b727006b
				linkStyle 36 stroke:#40438c,color:#40438c
				task_a81bf8a6[" k3s_server : Set image versions in manifest for metallb-native"]
				style task_a81bf8a6 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"13 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_a81bf8a6
				linkStyle 37 stroke:#40438c,color:#40438c
				task_2881a416[" k3s_server : Create manifests directory on first master"]
				style task_2881a416 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"14 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_2881a416
				linkStyle 38 stroke:#40438c,color:#40438c
				task_6676ccdf[" k3s_server : Download vip cloud provider manifest to first master"]
				style task_6676ccdf stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"15 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_6676ccdf
				linkStyle 39 stroke:#40438c,color:#40438c
				task_26177ef4[" k3s_server : Copy kubevip configMap manifest to first master"]
				style task_26177ef4 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"16 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_26177ef4
				linkStyle 40 stroke:#40438c,color:#40438c
				task_6e61af4f[" k3s_server : Init cluster inside the transient k3s-init service"]
				style task_6e61af4f stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"17"| task_6e61af4f
				linkStyle 41 stroke:#40438c,color:#40438c
				%% Start of the block 'Verification'
				block_e579d3dc["[block] Verification"]
				style block_e579d3dc fill:#40438c,color:#ffffff,stroke:#40438c
				role_0379e7a1 --> |"18 [when: not ansible_check_mode]"| block_e579d3dc
				linkStyle 42 stroke:#40438c,color:#40438c
				subgraph subgraph_block_e579d3dc["Verification "]
					task_051122f7[" k3s_server : Verify that all nodes actually joined (check k3s-init.service if this fails)"]
					style task_051122f7 stroke:#40438c,fill:#ffffff
					block_e579d3dc --> |"1 [when: not ansible_check_mode]"| task_051122f7
					linkStyle 43 stroke:#40438c,color:#40438c
				end
				%% End of the block 'Verification'
				task_f8c42d1e[" k3s_server : Copy K3s service file"]
				style task_f8c42d1e stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"19"| task_f8c42d1e
				linkStyle 44 stroke:#40438c,color:#40438c
				task_494d3f27[" k3s_server : Enable and check K3s service"]
				style task_494d3f27 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"20"| task_494d3f27
				linkStyle 45 stroke:#40438c,color:#40438c
				task_2af875a7[" k3s_server : Wait for node-token"]
				style task_2af875a7 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"21"| task_2af875a7
				linkStyle 46 stroke:#40438c,color:#40438c
				task_05d92b87[" k3s_server : Register node-token file access mode"]
				style task_05d92b87 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"22"| task_05d92b87
				linkStyle 47 stroke:#40438c,color:#40438c
				task_37ec7f12[" k3s_server : Change file access node-token"]
				style task_37ec7f12 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"23"| task_37ec7f12
				linkStyle 48 stroke:#40438c,color:#40438c
				task_d8f9757c[" k3s_server : Read node-token from master"]
				style task_d8f9757c stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"24"| task_d8f9757c
				linkStyle 49 stroke:#40438c,color:#40438c
				task_1334ed83[" k3s_server : Store Master node-token"]
				style task_1334ed83 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"25"| task_1334ed83
				linkStyle 50 stroke:#40438c,color:#40438c
				task_de09a7e9[" k3s_server : Restore node-token file access"]
				style task_de09a7e9 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"26"| task_de09a7e9
				linkStyle 51 stroke:#40438c,color:#40438c
				task_d16f4c43[" k3s_server : Create directory .kube"]
				style task_d16f4c43 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"27"| task_d16f4c43
				linkStyle 52 stroke:#40438c,color:#40438c
				task_7fd77811[" k3s_server : Copy config file to user home directory"]
				style task_7fd77811 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"28"| task_7fd77811
				linkStyle 53 stroke:#40438c,color:#40438c
				task_317d8db7[" k3s_server : Configure kubectl cluster to {{ endpoint_url }}"]
				style task_317d8db7 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"29"| task_317d8db7
				linkStyle 54 stroke:#40438c,color:#40438c
				task_4d3ae78a[" k3s_server : Create kubectl symlink"]
				style task_4d3ae78a stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"30 [when: k3s_create_kubectl_symlink | default(true) | bool]"| task_4d3ae78a
				linkStyle 55 stroke:#40438c,color:#40438c
				task_4365ca95[" k3s_server : Create crictl symlink"]
				style task_4365ca95 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"31 [when: k3s_create_crictl_symlink | default(true) | bool]"| task_4365ca95
				linkStyle 56 stroke:#40438c,color:#40438c
				task_d1a9ea32[" k3s_server : Get contents of manifests folder"]
				style task_d1a9ea32 stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"32"| task_d1a9ea32
				linkStyle 57 stroke:#40438c,color:#40438c
				task_0c2ba40b[" k3s_server : Get sub dirs of manifests folder"]
				style task_0c2ba40b stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"33"| task_0c2ba40b
				linkStyle 58 stroke:#40438c,color:#40438c
				task_4de1a70f[" k3s_server : Remove manifests and folders that are only needed for bootstrapping cluster so k3s doesn't auto apply on start"]
				style task_4de1a70f stroke:#40438c,fill:#ffffff
				role_0379e7a1 --> |"34"| task_4de1a70f
				linkStyle 59 stroke:#40438c,color:#40438c
			%% End of the role 'k3s_server'
		%% End of the play 'Play: Setup k3s servers (1)'
		%% Start of the play 'Play: Setup k3s agents (2)'
		play_3b24da8d["Play: Setup k3s agents (2)"]
		style play_3b24da8d fill:#3b19b3,color:#ffffff
		playbook_2f72d199 --> |"5"| play_3b24da8d
		linkStyle 60 stroke:#3b19b3,color:#3b19b3
			%% Start of the role 'k3s_agent'
			play_3b24da8d --> |"1"| role_c0b3525a
			linkStyle 61 stroke:#3b19b3,color:#3b19b3
			role_c0b3525a(["[role] k3s_agent"])
			style role_c0b3525a fill:#3b19b3,color:#ffffff,stroke:#3b19b3
				task_1061cfe6[" k3s_agent : Validating arguments against arg spec 'main' - Setup k3s agents"]
				style task_1061cfe6 stroke:#3b19b3,fill:#ffffff
				role_c0b3525a --> |"1"| task_1061cfe6
				linkStyle 62 stroke:#3b19b3,color:#3b19b3
				%% Start of the block 'Check for PXE-booted system'
				block_2067c255["[block] Check for PXE-booted system"]
				style block_2067c255 fill:#3b19b3,color:#ffffff,stroke:#3b19b3
				role_c0b3525a --> |"2"| block_2067c255
				linkStyle 63 stroke:#3b19b3,color:#3b19b3
				subgraph subgraph_block_2067c255["Check for PXE-booted system "]
					task_bf0cbfe4[" k3s_agent : Check if system is PXE-booted"]
					style task_bf0cbfe4 stroke:#3b19b3,fill:#ffffff
					block_2067c255 --> |"1"| task_bf0cbfe4
					linkStyle 64 stroke:#3b19b3,color:#3b19b3
					task_90fc4a75[" k3s_agent : Set fact for PXE-booted system"]
					style task_90fc4a75 stroke:#3b19b3,fill:#ffffff
					block_2067c255 --> |"2 [when: boot_cmdline.stdout is defined]"| task_90fc4a75
					linkStyle 65 stroke:#3b19b3,color:#3b19b3
					task_9d85fc21[" k3s_agent : Create k3s-node.service.d directory"]
					style task_9d85fc21 stroke:#3b19b3,fill:#ffffff
					block_2067c255 --> |"3 [when: proxy_env is defined]"| task_9d85fc21
					linkStyle 66 stroke:#3b19b3,color:#3b19b3
					task_ef4469ec[" k3s_agent : Copy K3s http_proxy conf file"]
					style task_ef4469ec stroke:#3b19b3,fill:#ffffff
					block_2067c255 --> |"4 [when: proxy_env is defined]"| task_ef4469ec
					linkStyle 67 stroke:#3b19b3,color:#3b19b3
				end
				%% End of the block 'Check for PXE-booted system'
				task_57993fc1[" k3s_agent : Create k3s-node.service.d directory"]
				style task_57993fc1 stroke:#3b19b3,fill:#ffffff
				role_c0b3525a --> |"3 [when: proxy_env is defined]"| task_57993fc1
				linkStyle 68 stroke:#3b19b3,color:#3b19b3
				task_f4b55deb[" k3s_agent : Copy K3s http_proxy conf file"]
				style task_f4b55deb stroke:#3b19b3,fill:#ffffff
				role_c0b3525a --> |"4 [when: proxy_env is defined]"| task_f4b55deb
				linkStyle 69 stroke:#3b19b3,color:#3b19b3
				task_821daf8c[" k3s_agent : Configure the k3s service"]
				style task_821daf8c stroke:#3b19b3,fill:#ffffff
				role_c0b3525a --> |"5"| task_821daf8c
				linkStyle 70 stroke:#3b19b3,color:#3b19b3
				task_f55ef5e8[" k3s_agent : Manage k3s service"]
				style task_f55ef5e8 stroke:#3b19b3,fill:#ffffff
				role_c0b3525a --> |"6"| task_f55ef5e8
				linkStyle 71 stroke:#3b19b3,color:#3b19b3
			%% End of the role 'k3s_agent'
		%% End of the play 'Play: Setup k3s agents (2)'
		%% Start of the play 'Play: Configure k3s cluster (1)'
		play_b0044dce["Play: Configure k3s cluster (1)"]
		style play_b0044dce fill:#ae1e84,color:#ffffff
		playbook_2f72d199 --> |"6"| play_b0044dce
		linkStyle 72 stroke:#ae1e84,color:#ae1e84
			%% Start of the role 'k3s_server_post'
			play_b0044dce --> |"1"| role_2844b457
			linkStyle 73 stroke:#ae1e84,color:#ae1e84
			role_2844b457(["[role] k3s_server_post"])
			style role_2844b457 fill:#ae1e84,color:#ffffff,stroke:#ae1e84
				task_c78ed78f[" k3s_server_post : Validating arguments against arg spec 'main' - Configure k3s cluster"]
				style task_c78ed78f stroke:#ae1e84,fill:#ffffff
				role_2844b457 --> |"1"| task_c78ed78f
				linkStyle 74 stroke:#ae1e84,color:#ae1e84
				%% Start of the block 'Deploy Calico to cluster'
				block_a8568276["[block] Deploy Calico to cluster"]
				style block_a8568276 fill:#ae1e84,color:#ffffff,stroke:#ae1e84
				role_2844b457 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_a8568276
				linkStyle 75 stroke:#ae1e84,color:#ae1e84
				subgraph subgraph_block_a8568276["Deploy Calico to cluster "]
					task_fc21bfaf[" k3s_server_post : Create manifests directory on first master"]
					style task_fc21bfaf stroke:#ae1e84,fill:#ffffff
					block_a8568276 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_fc21bfaf
					linkStyle 76 stroke:#ae1e84,color:#ae1e84
					task_46f41638[" k3s_server_post : Download to first master: manifest for Tigera Operator and Calico CRDs"]
					style task_46f41638 stroke:#ae1e84,fill:#ffffff
					block_a8568276 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_46f41638
					linkStyle 77 stroke:#ae1e84,color:#ae1e84
					task_05bce2fc[" k3s_server_post : Copy Calico custom resources manifest to first master"]
					style task_05bce2fc stroke:#ae1e84,fill:#ffffff
					block_a8568276 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_05bce2fc
					linkStyle 78 stroke:#ae1e84,color:#ae1e84
					%% Start of the block 'Deploy or replace Tigera Operator'
					block_26afeb2e["[block] Deploy or replace Tigera Operator"]
					style block_26afeb2e fill:#ae1e84,color:#ffffff,stroke:#ae1e84
					block_a8568276 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_26afeb2e
					linkStyle 79 stroke:#ae1e84,color:#ae1e84
					subgraph subgraph_block_26afeb2e["Deploy or replace Tigera Operator "]
						task_8bbf541d[" k3s_server_post : Deploy Tigera Operator"]
						style task_8bbf541d stroke:#ae1e84,fill:#ffffff
						block_26afeb2e --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_8bbf541d
						linkStyle 80 stroke:#ae1e84,color:#ae1e84
						task_c7360aad[" k3s_server_post : Wait for Tigera Operator resources"]
						style task_c7360aad stroke:#ae1e84,fill:#ffffff
						block_26afeb2e --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_c7360aad
						linkStyle 81 stroke:#ae1e84,color:#ae1e84
						%% Start of the block 'Deploy Calico custom resources'
						block_1453ab58["[block] Deploy Calico custom resources"]
						style block_1453ab58 fill:#ae1e84,color:#ffffff,stroke:#ae1e84
						block_26afeb2e --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_1453ab58
						linkStyle 82 stroke:#ae1e84,color:#ae1e84
						subgraph subgraph_block_1453ab58["Deploy Calico custom resources "]
							task_425b3873[" k3s_server_post : Deploy custom resources for Calico"]
							style task_425b3873 stroke:#ae1e84,fill:#ffffff
							block_1453ab58 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_425b3873
							linkStyle 83 stroke:#ae1e84,color:#ae1e84
							task_8b844bfc[" k3s_server_post : Wait for Calico system resources to be available"]
							style task_8b844bfc stroke:#ae1e84,fill:#ffffff
							block_1453ab58 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_8b844bfc
							linkStyle 84 stroke:#ae1e84,color:#ae1e84
							task_06764055[" k3s_server_post : Patch Felix configuration for eBPF mode"]
							style task_06764055 stroke:#ae1e84,fill:#ffffff
							block_1453ab58 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and calico_ebpf]"| task_06764055
							linkStyle 85 stroke:#ae1e84,color:#ae1e84
							%% Start of the block 'Prepare Cilium CLI on first master and deploy CNI'
							block_7c0dab5a["[block] Prepare Cilium CLI on first master and deploy CNI"]
							style block_7c0dab5a fill:#ae1e84,color:#ffffff,stroke:#ae1e84
							block_1453ab58 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| block_7c0dab5a
							linkStyle 86 stroke:#ae1e84,color:#ae1e84
							subgraph subgraph_block_7c0dab5a["Prepare Cilium CLI on first master and deploy CNI "]
								task_4a22bf9a[" k3s_server_post : Create tmp directory on first master"]
								style task_4a22bf9a stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_4a22bf9a
								linkStyle 87 stroke:#ae1e84,color:#ae1e84
								task_2fd9043a[" k3s_server_post : Check if Cilium CLI is installed"]
								style task_2fd9043a stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_2fd9043a
								linkStyle 88 stroke:#ae1e84,color:#ae1e84
								task_a9064d12[" k3s_server_post : Check for Cilium CLI version in command output"]
								style task_a9064d12 stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_installed.rc == 0]"| task_a9064d12
								linkStyle 89 stroke:#ae1e84,color:#ae1e84
								task_53a0eb26[" k3s_server_post : Get latest stable Cilium CLI version file"]
								style task_53a0eb26 stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_53a0eb26
								linkStyle 90 stroke:#ae1e84,color:#ae1e84
								task_d9d006ac[" k3s_server_post : Read Cilium CLI stable version from file"]
								style task_d9d006ac stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_d9d006ac
								linkStyle 91 stroke:#ae1e84,color:#ae1e84
								task_9f6a9921[" k3s_server_post : Log installed Cilium CLI version"]
								style task_9f6a9921 stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_9f6a9921
								linkStyle 92 stroke:#ae1e84,color:#ae1e84
								task_ad758abc[" k3s_server_post : Log latest stable Cilium CLI version"]
								style task_ad758abc stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_ad758abc
								linkStyle 93 stroke:#ae1e84,color:#ae1e84
								task_b387ed88[" k3s_server_post : Determine if Cilium CLI needs installation or update"]
								style task_b387ed88 stroke:#ae1e84,fill:#ffffff
								block_7c0dab5a --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_b387ed88
								linkStyle 94 stroke:#ae1e84,color:#ae1e84
								%% Start of the block 'Install or update Cilium CLI'
								block_3e4a983f["[block] Install or update Cilium CLI"]
								style block_3e4a983f fill:#ae1e84,color:#ffffff,stroke:#ae1e84
								block_7c0dab5a --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| block_3e4a983f
								linkStyle 95 stroke:#ae1e84,color:#ae1e84
								subgraph subgraph_block_3e4a983f["Install or update Cilium CLI "]
									task_a465333a[" k3s_server_post : Set architecture variable"]
									style task_a465333a stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_a465333a
									linkStyle 96 stroke:#ae1e84,color:#ae1e84
									task_980a3ae2[" k3s_server_post : Download Cilium CLI and checksum"]
									style task_980a3ae2 stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_980a3ae2
									linkStyle 97 stroke:#ae1e84,color:#ae1e84
									task_a602511d[" k3s_server_post : Verify the downloaded tarball"]
									style task_a602511d stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_a602511d
									linkStyle 98 stroke:#ae1e84,color:#ae1e84
									task_47b9a721[" k3s_server_post : Extract Cilium CLI to /usr/local/bin"]
									style task_47b9a721 stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_47b9a721
									linkStyle 99 stroke:#ae1e84,color:#ae1e84
									task_d4e3c2ef[" k3s_server_post : Remove downloaded tarball and checksum file"]
									style task_d4e3c2ef stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_cli_needs_update]"| task_d4e3c2ef
									linkStyle 100 stroke:#ae1e84,color:#ae1e84
									task_a5d927d8[" k3s_server_post : Wait for connectivity to kube VIP"]
									style task_a5d927d8 stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_a5d927d8
									linkStyle 101 stroke:#ae1e84,color:#ae1e84
									task_12bd9850[" k3s_server_post : Fail if kube VIP not reachable"]
									style task_12bd9850 stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and ping_result.rc != 0]"| task_12bd9850
									linkStyle 102 stroke:#ae1e84,color:#ae1e84
									task_ab81c863[" k3s_server_post : Test for existing Cilium install"]
									style task_ab81c863 stroke:#ae1e84,fill:#ffffff
									block_3e4a983f --> |"8 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_ab81c863
									linkStyle 103 stroke:#ae1e84,color:#ae1e84
									%% Start of the block 'Check existing Cilium install'
									block_102cda84["[block] Check existing Cilium install"]
									style block_102cda84 fill:#ae1e84,color:#ffffff,stroke:#ae1e84
									block_3e4a983f --> |"9 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| block_102cda84
									linkStyle 104 stroke:#ae1e84,color:#ae1e84
									subgraph subgraph_block_102cda84["Check existing Cilium install "]
										task_15a7cf1a[" k3s_server_post : Check Cilium version"]
										style task_15a7cf1a stroke:#ae1e84,fill:#ffffff
										block_102cda84 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_15a7cf1a
										linkStyle 105 stroke:#ae1e84,color:#ae1e84
										task_3247fcf0[" k3s_server_post : Parse installed Cilium version"]
										style task_3247fcf0 stroke:#ae1e84,fill:#ffffff
										block_102cda84 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_3247fcf0
										linkStyle 106 stroke:#ae1e84,color:#ae1e84
										task_9bb19899[" k3s_server_post : Determine if Cilium needs update"]
										style task_9bb19899 stroke:#ae1e84,fill:#ffffff
										block_102cda84 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_9bb19899
										linkStyle 107 stroke:#ae1e84,color:#ae1e84
										task_20796507[" k3s_server_post : Log result"]
										style task_20796507 stroke:#ae1e84,fill:#ffffff
										block_102cda84 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc == 0]"| task_20796507
										linkStyle 108 stroke:#ae1e84,color:#ae1e84
										task_222de75c[" k3s_server_post : Install Cilium"]
										style task_222de75c stroke:#ae1e84,fill:#ffffff
										block_102cda84 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_installed.rc != 0 or cilium_needs_update]"| task_222de75c
										linkStyle 109 stroke:#ae1e84,color:#ae1e84
										task_ee8c65f2[" k3s_server_post : Wait for Cilium resources"]
										style task_ee8c65f2 stroke:#ae1e84,fill:#ffffff
										block_102cda84 --> |"6 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and not item.check_hubble | default(false) or (item.check_hubble | default(false) and cilium_hubble)]"| task_ee8c65f2
										linkStyle 110 stroke:#ae1e84,color:#ae1e84
										%% Start of the block 'Configure Cilium BGP'
										block_55db3327["[block] Configure Cilium BGP"]
										style block_55db3327 fill:#ae1e84,color:#ffffff,stroke:#ae1e84
										block_102cda84 --> |"7 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| block_55db3327
										linkStyle 111 stroke:#ae1e84,color:#ae1e84
										subgraph subgraph_block_55db3327["Configure Cilium BGP "]
											task_0063d2e7[" k3s_server_post : Set _cilium_bgp_neighbors fact"]
											style task_0063d2e7 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_0063d2e7
											linkStyle 112 stroke:#ae1e84,color:#ae1e84
											task_e41b631e[" k3s_server_post : Copy BGP manifests to first master"]
											style task_e41b631e stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"2 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_e41b631e
											linkStyle 113 stroke:#ae1e84,color:#ae1e84
											task_3ab215a2[" k3s_server_post : Apply BGP manifests"]
											style task_3ab215a2 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"3 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_3ab215a2
											linkStyle 114 stroke:#ae1e84,color:#ae1e84
											task_960455ac[" k3s_server_post : Print error message if BGP manifests application fails"]
											style task_960455ac stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"4 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp and 'is invalid' in apply_cr.stderr]"| task_960455ac
											linkStyle 115 stroke:#ae1e84,color:#ae1e84
											task_330ff4c3[" k3s_server_post : Test for BGP config resources"]
											style task_330ff4c3 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"5 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] and cilium_bgp]"| task_330ff4c3
											linkStyle 116 stroke:#ae1e84,color:#ae1e84
											task_31d2c297[" k3s_server_post : Create manifests directory for temp configuration"]
											style task_31d2c297 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"6"| task_31d2c297
											linkStyle 117 stroke:#ae1e84,color:#ae1e84
											task_9ca007cb[" k3s_server_post : Delete outdated metallb replicas"]
											style task_9ca007cb stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"7"| task_9ca007cb
											linkStyle 118 stroke:#ae1e84,color:#ae1e84
											task_6e7a6f17[" k3s_server_post : Copy metallb CRs manifest to first master"]
											style task_6e7a6f17 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"8"| task_6e7a6f17
											linkStyle 119 stroke:#ae1e84,color:#ae1e84
											task_74921a26[" k3s_server_post : Test metallb-system namespace"]
											style task_74921a26 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"9"| task_74921a26
											linkStyle 120 stroke:#ae1e84,color:#ae1e84
											task_c0718112[" k3s_server_post : Wait for MetalLB resources"]
											style task_c0718112 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"10"| task_c0718112
											linkStyle 121 stroke:#ae1e84,color:#ae1e84
											task_52acacdc[" k3s_server_post : Set metallb webhook service name"]
											style task_52acacdc stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"11"| task_52acacdc
											linkStyle 122 stroke:#ae1e84,color:#ae1e84
											task_f1a3eeed[" k3s_server_post : Test metallb-system webhook-service endpoint"]
											style task_f1a3eeed stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"12"| task_f1a3eeed
											linkStyle 123 stroke:#ae1e84,color:#ae1e84
											task_96ddd88c[" k3s_server_post : Apply metallb CRs"]
											style task_96ddd88c stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"13"| task_96ddd88c
											linkStyle 124 stroke:#ae1e84,color:#ae1e84
											task_5278687f[" k3s_server_post : Test metallb-system resources for Layer 2 configuration"]
											style task_5278687f stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"14 [when: metal_lb_mode == 'layer2']"| task_5278687f
											linkStyle 125 stroke:#ae1e84,color:#ae1e84
											task_e241c5f3[" k3s_server_post : Test metallb-system resources for BGP configuration"]
											style task_e241c5f3 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"15 [when: metal_lb_mode == 'bgp']"| task_e241c5f3
											linkStyle 126 stroke:#ae1e84,color:#ae1e84
											task_1a1a9790[" k3s_server_post : Remove tmp directory used for manifests"]
											style task_1a1a9790 stroke:#ae1e84,fill:#ffffff
											block_55db3327 --> |"16"| task_1a1a9790
											linkStyle 127 stroke:#ae1e84,color:#ae1e84
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
		play_22cbfffb["Play: Storing kubeconfig in the playbook directory (1)"]
		style play_22cbfffb fill:#7e9d2f,color:#ffffff
		playbook_2f72d199 --> |"7"| play_22cbfffb
		linkStyle 128 stroke:#7e9d2f,color:#7e9d2f
			task_ea815451["[task]  Copying kubeconfig from {{ hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname'] }}"]
			style task_ea815451 stroke:#7e9d2f,fill:#ffffff
			play_22cbfffb --> |"1 [when: ansible_hostname == hostvars[groups[group_name_master | default('master')][0]]['ansible_hostname']]"| task_ea815451
			linkStyle 129 stroke:#7e9d2f,color:#7e9d2f
		%% End of the play 'Play: Storing kubeconfig in the playbook directory (1)'
	%% End of the playbook '/Users/blt/Documents/Github/perso/SAE503/k3s-ansible/site.yml'

```

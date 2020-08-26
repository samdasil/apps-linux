#!/bin/bash

    refresh="NAO INSTALADO"
    cups="NAO INSTALADO"
    ssh="NAO INSTALADO"
    flash="NAO INSTALADO"
    fontes="NAO INSTALADO"
    share="NAO INSTALADO"
    samba="NAO INSTALADO"
    firefox="NAO INSTALADO"
    thunderbird="NAO INSTALADO"
    remmina="NAO INSTALADO"
    anydesk="NAO INSTALADO"
    wps="NAO INSTALADO"
    skype="NAO INSTALADO"
    stacer="NAO INSTALADO"
    google="NAO INSTALADO"
    teamviewer="NAO INSTALADO"
    idiomas="NAO INSTALADO"
    usuario=$(whoami)
    atalhos="NAO INSTALADO"
    hplip="NAO INSTALADO"
    upgrade="NAO ATUALIZADO"
    
    login=administrador
    password=123456
    repositorio_ip="127.0.0.1"
    domain="WORKGROUP"
    repo_mint="aptcachemint"
    repo_ubuntu="aptcacheubuntu"


Main(){

	clear

	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"

	echo -e "	\033[01;33m 1 \033[00;36m - Instalar todos os programas padrões \n\n"
	echo -e "	\033[01;33m 2 \033[00;36m - Atualizar a base de repositorio do servidor \n\n"
	echo -e "	\033[01;33m 3 \033[00;36m - Realizar limpeza de arquivos temporarios\n\n"
	echo -e "	\033[01;33m 4 \033[00;36m - Recuperar pacotes do linux\n\n"
	echo -e "	\033[01;33m 5 \033[01;31m - Sair\n\n"

	echo -e "	\033[01;33m Opcao : \033[01;32m "
	read op
    clear

	case $op in
        
		"1")Instalar ;;
		"2")updatesrv ;;
		"3")Limpar ;;
		"4")Recuperar ;;
		"5")exit ;;
		"*")echo -e "Opcao desconhecida.\n\n\n" ;;
	esac
}

Montar(){
    echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo "Criando diretorio padroes"
	echo ""

    if [ -e "/mnt/cache" ];then
        echo "Diretório Cache já existe."
    else 
        sudo mkdir /mnt/cache
    fi

   if [ -e "/mnt/program" ];then
        echo "Diretório Program já existe."
    else 
        sudo mkdir /mnt/program
    fi  

    if [ -e "/home/downloads" ];then
        echo "Diretório downloads já existe.\n"
    else 
        sudo mkdir /home/downloads/ 
        sudo chmod 777 /home/downloads
        if [ $? -eq 0 ];then
            echo "Permissões ao diretório adicionadas."
        else   
            echo "Erro ao criar permissões do diretório downloads.\n"
            echo "Verificar script. Linha 76.\n"
            echo "Voltando ao menu principal em 5 segundos...\n\n"
            sleep 5
            Main
        fi
    fi  
	    

    echo ">>>>>>>       Montando compartihamento remoto"
	echo ""
    
    lsb_release -a | grep LinuxMint --silent
    
    if [ $? -eq 0 ];then
        echo $mint
	    sudo mount -t cifs //$repositorio_ip/$repo_mint  /mnt/cache/ -o username=$login,password=$password,domain=$domain
    else
        lsb_release -a | grep Ubuntu --silent
        if [ $? -eq 0 ];then
            echo $ubuntu
            sudo mount -t cifs //$repositorio_ip/$repo_ubuntu  /mnt/cache/ -o username=$login,password=$password,domain=$domain
	    else
            echo -e "Erro ao selecionar repositório de cache.\n\n"
            echo -e "Aplicativo suportado apenas para LinuxMint ou Ubuntu.\n\n"
            echo -e "Voltando para menu Principal em 5 segundos..."
            sleep 5
            Main
        fi
    fi

    echo "Atualizando a base do archives" 
	echo ""
	
    sudo cp -R /mnt/cache/* /var/cache/apt/archives/.
    if [ $? -ne 0 ];then
        echo " Não foi possível atualizar base do archives."
    fi
	
	echo "Montando compartilhamento dos Programas Padroes"
	echo " "
	sudo mount -t cifs //$repositorio_ip/program /mnt/program -o username=$login,password=$password,domain=$domain
	if [ $? -ne 0 ];then
        echo -e "Não foi possível copiar alguns programas do repositório de cache."
    fi

	echo "Atualizando a base de Programas"
	sudo cp -R /mnt/program/* /home/downloads/.
    if [ $? -ne 0 ];then
        echo -e "Não foi possível atualizar a base de programas do repositório, erro ao copiar. Linha 125.\n\n"
    fi

}

Instalar(){
    Montar
    cd /home/downloads
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"


################################################################################################################

  Andamento
    #update
	sudo apt-get update -y
        if [ $? -eq 0 ];then
            refresh="OK"
            echo
        else
            refresh="ERRO"
            clear
            echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
            echo -e "Falha ao atualizar pacotes, iniciando reparação do DPKG e Resolução de Dependências\n\n\n"
            echo -e " ----------------------------   //////    ----------------------------\n\n\n"
            sleep 5
            Recupere
        fi
    clear

################################################################################################################

  Andamento
	#cups-pdf
	sudo apt-get install cups-pdf -y
        if [ $? -eq 0 ];then
            cups="OK"
        else
            cups="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#ssh
	sudo apt-get install ssh -y
        if [ $? -eq 0 ];then
            ssh="OK"
        else
            ssh="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#adobe flash
	sudo apt-get install flashplugin-installer -y
        if [ $? -eq 0 ];then
            flash="OK"
        else
            flash="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

	Andamento
	#fontes microsoft
	sudo apt-get install ttf-mscorefonts-installer -y
        if [ $? -eq 0 ];then
            fontes="OK"
        else
            fontes="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#caja-share
	sudo apt-get install caja-share -y
        if [ $? -eq 0 ];then
            share="OK"
        else
            share="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#samba
	sudo apt-get install samba -y
        if [ $? -eq 0 ];then
            samba="OK"
        else
            samba="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#firefox
    sudo apt-get -f install firefox -y
        if [ $? -eq 0 ];then
            firefox="OK"
        else
            firefox="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#thunderbird
    sudo apt-get -f install thunderbird-locale-pt-br -y
        if [ $? -eq 0 ];then
            thunderbird="OK"
        else
            thunderbird="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#remmina
	sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
	sudo apt-get update
	sudo apt-get install remmina -y remmina-plugin-rdp -y libfreerdp-plugins-standard -y
        if [ $? -eq 0 ];then
            remmina="OK"
        else
            remmina="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#anydesk
	sudo dpkg -i anydesk_2.9.5-1_amd64.deb && sudo apt install -f --force-yes
        if [ $? -eq 0 ];then
            anydesk="OK"
        else
            anydesk="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#WPS
    if [ $? -eq 0 ];then

        sudo dpkg -i wps-office_10.1.0.5707~a21_amd64.deb
        if [ $? -eq 0 ];then

            sudo dpkg -i wps-office-language-all_0.1_all.deb
            if [ $? -eq 0 ];then

                sudo dpkg -i wps-office-mui-pt-br_1.1.0-0kaiana1_all.deb
                if [ $? -eq 0 ];then

                    sudo dpkg -i web-office-fonts.deb
                    if [ $? -eq 0 ];then
                        wps="OK"
                    else
                        wps="ERRO, FONTES NÃO INSTALADAS"
                        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                        sleep 3
                    fi
                else
                    wps="ERRO, PACOTE PT-BR NÃO INSTALADO"
                    echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                    sleep 3
                fi

            else
                wps="ERRO, IDIOMA NÃO INSTALADO"
                echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                sleep 3
            fi
        else
            wps="ERRO, PACOTE WPS NÃO INSTALADO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 3
        fi

    else
        wps="ERRO, CAMINHO NÃO ENCONTRADO"
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 3
    fi

    clear

################################################################################################################

  Andamento
	#skype
    if [ $? -eq 0 ];then

        sudo dpkg -i skypeforlinux-64.deb
        if [ $? -eq 0 ];then
            skype="OK"
        else
            skype="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        skype="ERRO, PASTA NÃO ENCONTRADA"
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi
    clear

################################################################################################################

  Andamento
	#Stacer 64bits
    if [ $? -eq 0 ];then

        sudo dpkg -i stacer_1.0.8_amd64.deb
        if [ $? -eq 0 ];then
        stacer="OK"
        else
            stacer="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        stacer="ERRO, PASTA NÃO ENCONTRADA"
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi

    clear

################################################################################################################

  Andamento
	#google chrome
    if [ $? -eq 0 ];then

        sudo dpkg -i google-chrome-stable_current_amd64.deb
        if [ $? -eq 0 ];then
        google="OK"
        else
            google="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        google="ERRO, PASTA NÃO ENCONTRADA"
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi

    clear

################################################################################################################

  Andamento
	#teamviewer 9
    if [ $? -eq 0 ];then

        sudo dpkg -i teamviewer_linux.deb
        if [ $? -eq 0 ];then
        teamviewer="OK"
        else
            teamviewer="ERRO"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        teamviewer="ERRO, PASTA NÃO ENCONTRADA"
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi

    clear

################################################################################################################

  Andamento
	#pacote de idiomas portugues
  sudo apt-get -f install -y
	sudo apt-get install language-pack-gnome-pt language-pack-pt-base -y
        if [ $? -eq 0 ];then
            idiomas="OK"
        else
            idiomas="ERRO, PACOTE GNOME PT-BR"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi

    clear

################################################################################################################

	#criar atalhos de aplicativos na area de trabalho do usuario
	
	cd /usr/share/applications/
	cp -a anydesk.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a thunderbird.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a wps-office-et.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a wps-office-wpp.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a wps-office-wps.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a remmina.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a skypeforlinux.desktop /home/$usuario/Área\ de\ Trabalho
	#cp -a filezilla.desktop /home/$usuario/Área\ de\ Trabalho
	cp -a teamviewer-teamviewer9.desktop /home/$usuario/Área\ de\ Trabalho
	mkdir /home/$usuario/Área\ de\ Trabalho/REMOTO
	mkdir /home/$usuario/Área\ de\ Trabalho/SCAN

	cd /opt/teamviewer9/tv_bin/desktop
	cp -a teamviewer-teamviewer9.desktop /home/$usuario/Área\ de\ Trabalho
  cp -a anydesk.desktop /home/$usuario/Área\ de\ Trabalho
  cd /home/$usuario/Área\ de\ Trabalho
  chmod 777 *
	atalhos="OK"

################################################################################################################

  Andamento
  #hplip
	cd /home/downloads
	chmod 777 hplip-3.17.10.run
	./hplip-3.17.10.run

  $count=$(dpkg -l | grep hplip | grep 3.17.10 | wl -c)
  if [ $count > 0 ];then
    hplip="OK"
  else
    hplip="ERRO"
  fi

	clear
	Andamento
  Atualizar
  upgrade="OK"
  Andamento
  Main
}

updatesrv(){

    clear
    echo "Atualizando a base de Pacotes do Servidor"
    echo ""
    sudo scp /var/cache/apt/archives/* /mnt/cache/.
}

################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################

Limpar(){
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	sudo apt autoremove -y

	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " ------------------------  Limpeza Finalizada ! ----------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Pressione [Enter] para voltar ao menu\n "
	read x
	clear
	Main
}

Recuperar(){
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Recuperando os arquivos do linux, aguarde um momento...\n\n "
	sudo dpkg --configure -a
	sudo apt install -f --force-yes
	sudo apt update
	sudo apt full-upgrade -y
	sudo apt autoremove -y
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " ------------------------  Recuperação Finalizada ! ------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Pressione [Enter] para voltar ao menu\n "
	read x
	clear
	Main
}

Repare(){
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Recuperando os arquivos do linux, aguarde um momento...\n\n "
	sudo dpkg --configure -a
	sudo apt install -f --force-yes
	sudo apt update
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " ------------------------  Recuperação Finalizada ! ------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Continuando instalação dos programas...\n "
	sleep 3
	clear
}

Atualizar(){
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " O sistema será atualizado...\n\n "

  sudo dpkg --configure -a
	sudo apt install -f --force-yes
	sudo apt update
  sudo apt full-upgrade -y
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " ------------------------  Atualização Finalizada ! ------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Continuando instalação dos programas...\n "
	sleep 3
	clear
}

#function verifica(){
#    if [ $1 -eq 0 ];then
#      echo -e \033[01;32m OK"
#    else
#      echo -e \033[01;31m ERRO"
#    fi
#}

Andamento(){
  clear
	echo -e " ----------------------------   CONTTI   ----------------------------\n\n\n"
    echo -e "\033[00;36m"
	echo -e "01 - ATUALIZAR REPOSITORIOS         -     $refresh"
	echo -e "02 - CUPS-PDF                       -     $cups"
	echo -e "03 - SSH                            -     $ssh"
	echo -e "04 - FLASH-PLAYER-PLUGIN            -     $flash"
	echo -e "05 - FONTES MICROSOFT               -     $fontes"
	echo -e "06 - CAJA-SHARE (COMPARTILHAMENTO)  -     $share"
	echo -e "07 - SAMBA                          -     $samba"
	echo -e "08 - MOZILLA FIREFOX                -     $firefox"
	echo -e "09 - THUNDERBIRD                    -     $thunderbird"
	echo -e "10 - REMMINA                        -     $remmina"
	echo -e "12 - ANYDESK                        -     $anydesk"
	echo -e "13 - WPS                            -     $wps"
	echo -e "14 - SKYPE                          -     $skype"
	echo -e "15 - skype                          -     $wps"
	echo -e "16 - GOOGLE CHROME                  -     $google"
	echo -e "17 - TEAM VIEWER 9                  -     $teamviewer"
	echo -e "18 - IDIOMAS                        -     $idiomas"
	echo -e "19 - HPLIP 3.17.10                  -     $hplip"
	echo -e "20 - UPGRADE DO SISTEMA             -     $upgrade"
    echo -e "\033[01;37m"

	if [ "$upgrade" = "OK" ];then

	   echo -e " \n\n\n "
           echo -e " ------------------------  instalação Finalizada ! ------------------\n\n\n"
	   echo -e " Tecle [ENTER] \n\n\n "
           read op
    fi
          
	sleep 3
	clear
}

Main
#!/bin/bash

    refresh1=1
    cups=1
    ssh=1
    flash=1
    fontes=1
    share=1
    samba=1
    firefox=1
    thunderbird=1
    remmina=1
    anydesk=1
    wps=1
    skype=1
    stacer=1
    google=1
    teamviewer=1
    idiomas=1
    usuario=$(whoami)
    atalhos=1
    hplip=1


Main(){

	clear

	Cabecalho
	echo -e "	\033[01;33m 1 \033[00;46m - Instalar todos os programas padrões Exata Cargo\n\n"
	echo -e "	\033[01;33m 2 \033[00;46m - Realizar limpeza de arquivos temporarios\n\n"
	echo -e "	\033[01;33m 3 \033[00;46m - Recuperar pacotes do linux\n\n"
	echo -e "	\033[01;33m 4 \033[00;46m - Sair\n\n"

	echo -e"	\033[01;3m Opcao : \033[01;33m "
	read op
  clear

	case $op in
		"1")Instalar ;;
		"2")Limpar ;;
		"3")Recuperar ;;
		"4")exit ;;
		"*")echo -e "Opcao desconhecida.\n\n\n" ;;
	esac
}

Cabecalho(){
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                                CONTTI                                  |\n"
  echo -e " -------------------------------------------------------------------------\n"
}

Instalar(){
	clear
	Cabecalho


################################################################################################################

  Andamento
  #update
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                              ATUALIZAR                                 |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get update
        if [ $? -eq 0 ];then
            refresh1=0
            echo
        else
            refresh1=1
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
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                              CUPS-PDF                                  |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get install cups-pdf -y
        if [ $? -eq 0 ];then
            cups=0
        else
            cups=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#ssh
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                                 SSH                                    |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get install ssh -y
        if [ $? -eq 0 ];then
            ssh=0
        else
            ssh=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#adobe flash
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                             FLASH-PLUGIN                               |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get install flashplugin-installer -y
        if [ $? -eq 0 ];then
            flash=0
        else
            flash=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

	Andamento
	#fontes microsoft
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                      TTF-MSCOREFONTS-INSTALLER                         |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get install ttf-mscorefonts-installer -y
        if [ $? -eq 0 ];then
            fontes=0
        else
            fontes=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#caja-share
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                              CAJA-SHARE                                |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get install caja-share -y
        if [ $? -eq 0 ];then
            share=0
        else
            share=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#samba
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                                SAMBA                                   |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get install samba -y
        if [ $? -eq 0 ];then
            samba=0
        else
            samba=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#firefox
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                               FIREFOX                                  |\n"
  echo -e " -------------------------------------------------------------------------\n"
  sudo apt-get -f install firefox -y
      if [ $? -eq 0 ];then
          firefox=0
      else
          firefox=1
          echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
          sleep 5
      fi
  clear

################################################################################################################

  Andamento
	#thunderbird
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                             THUNDERBIRD                                |\n"
  echo -e " -------------------------------------------------------------------------\n"
  sudo apt-get -f install thunderbird-locale-pt-br -y
      if [ $? -eq 0 ];then
          thunderbird=0
      else
          thunderbird=1
          echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
          sleep 5
      fi
  clear

################################################################################################################

    Andamento
	#remmina
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                               REMMINA                                  |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
	sudo apt-get update
	sudo apt-get install remmina -y remmina-plugin-rdp -y libfreerdp-plugins-standard -y
        if [ $? -eq 0 ];then
            remmina=0
        else
            remmina=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#anydesk
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                               ANYDESK                                  |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo dpkg -i anydesk_2.9.5-1_amd64.deb
        if [ $? -eq 0 ];then
            anydesk=0
        else
            anydesk=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

  Andamento
	#WPS
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                              WPS OFFICE                                |\n"
  echo -e " -------------------------------------------------------------------------\n"
	cd /home/$usuario/Downloads/WPS\ OFFICE/
    if [ $? -eq 0 ];then

        sudo dpkg -i wps-office_10.1.0.5707~a21_amd64.deb
        if [ $? -eq 0 ];then

            sudo dpkg -i wps-office-language-all_0.1_all.deb
            if [ $? -eq 0 ];then

                sudo dpkg -i wps-office-mui-pt-br_1.1.0-0kaiana1_all.deb
                if [ $? -eq 0 ];then

                    sudo dpkg -i web-office-fonts.deb
                    if [ $? -eq 0 ];then
                        wps=0
                    else
                        wps=1
                        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                        sleep 3
                    fi
                else
                    wps=1
                    echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                    sleep 3
                fi

            else
                wps=1
                echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                sleep 3
            fi
        else
            wps=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 3
        fi

    else
        wps=1
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 3
    fi

    clear

################################################################################################################

  Andamento
	#skype
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                                SKYPE                                   |\n"
  echo -e " -------------------------------------------------------------------------\n"
	cd /home/$usuario/Downloads/Linux/Skype	/
    if [ $? -eq 0 ];then

        sudo dpkg -i skypeforlinux-64.deb
        if [ $? -eq 0 ];then
            skype=0
        else
            skype=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        skype=1
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi
    clear

################################################################################################################

  Andamento
	#Stacer 64bits
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                                STACER                                  |\n"
  echo -e " -------------------------------------------------------------------------\n"
	cd /home/$usuario/Downloads/Linux/Stacer/
    if [ $? -eq 0 ];then
        sudo dpkg -i stacer_1.0.8_amd64.deb
        if [ $? -eq 0 ];then
        stacer=0
        else
            stacer=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        stacer=1
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi

    clear

################################################################################################################

  Andamento
	#google chrome
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                             NAVEGADORES                                |\n"
  echo -e " -------------------------------------------------------------------------\n"
	cd /home/$usuario/Downloads/Linux/Navegadores/
    if [ $? -eq 0 ];then

        sudo dpkg -i google-chrome-stable_current_amd64.deb
        if [ $? -eq 0 ];then
        google=0
        else
            google=1
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    else
        google=1
        echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
        sleep 5
    fi

    clear

################################################################################################################

  Andamento
	#teamviewer 9
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                             TEAM VIEWER                                |\n"
  echo -e " -------------------------------------------------------------------------\n"
	cd /home/$usuario/Downloads/Linux/Team\ Viewer/
    if [ $? -eq 0 ];then

        sudo dpkg -i teamviewer_linux.deb
        if [ $? -eq 0 ];then
        teamviewer=0
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
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                          PACOTE DE IDIOMA                              |\n"
  echo -e " -------------------------------------------------------------------------\n"
	sudo apt-get -f install language-pack-gnome-pt language-pack-pt-base -y
        if [ $? -eq 0 ];then

            sudo apt-get -f install language-support-pt -y
            if [ $? -eq 0 ];then
                idiomas=0
            else
                idiomas="ERRO, SUPORTE PT-BR"
                echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
                sleep 5
            fi

        else
            idiomas="ERRO, PACOTE GNOME PT-BR"
            echo -e "Aguarde ou pressione [Enter] para continuar e CTRL+C para sair..."
            sleep 5
        fi
    clear

################################################################################################################

	#criar atalhos de aplicativos na area de trabalho do usuario
	cd /usr/share/applications
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

  cd /home/$usuario/Área\ de\ Trabalho/
  chmod 777 *
  atalhos=0

################################################################################################################

  Andamento
  #hplip
  echo -e " -------------------------------------------------------------------------\n"
  echo -e " |                                HPLIP                                   |\n"
  echo -e " -------------------------------------------------------------------------\n"
	cp /home/$usuario/Downloads/Linux/Impressora\ HP/hplip-3.17.10.run /home/$usuario/Downloads
	cd /home/$usuario/Downloads/
	chmod 777 hplip-3.17.10.run
	./hplip-3.17.10.run

  $count=$(dpkg -l | grep hplip | grep 3.17.10 | wl -c)
  if [ $count > 0 ]; then
    hplip=1
  else
    hplip="ERRO"
  fi

	clear
	Andamento
  Atualizar
  Andamento
  Main
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
	sudo apt upgrade -y
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
  sudo apt upgrade -y
	clear
	echo -e " ----------------------------   CONTTI    ----------------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " ------------------------  Atualização Finalizada ! ------------------\n\n\n"
	echo -e " \n\n\n\n "
	echo -e " Continuando instalação dos programas...\n "
	sleep 3
	clear
}

function verifica(){
    if [ $1 -eq 0 ]; then
      echo -e "\033[01;32m OK \033[01;43m"
    else
      echo -e "\033[01;31m ERRO \033[01;43m"
    fi
}

Andamento(){
  clear
	echo -e " ----------------------------   CONTTI   ----------------------------\n\n\n"
	echo -e "\033[00;43m01 - ATUALIZAR REPOSITORIOS         -   " ; verifica "$refresh1";
	echo -e "\033[00;43m02 - CUPS-PDF                       -   " ; verifica "$cups";
	echo -e "\033[00;43m03 - SSH                            -   " ; verifica "$ssh";
	echo -e "\033[00;43m04 - FLASH-PLAYER-PLUGIN            -   " ; verifica "$flash";
	echo -e "\033[00;43m05 - FONTES MICROSOFT               -   " ; verifica "$fontes";
	echo -e "\033[00;43m06 - CAJA-SHARE (COMPARTILHAMENTO)  -   " ; verifica "$share";
	echo -e "\033[00;43m07 - SAMBA                          -   " ; verifica "$samba";
	echo -e "\033[00;43m08 - MOZILLA FIREFOX                -   " ; verifica "$firefox";
	echo -e "\033[00;43m09 - THUNDERBIRD                    -   " ; verifica "$thunderbird";
	echo -e "\033[00;43m10 - REMMINA                        -   " ; verifica "$remmina";
	echo -e "\033[00;43m12 - ANYDESK                        -   " ; verifica "$anydesk";
	echo -e "\033[00;43m13 - WPS                            -   " ; verifica "$wps";
	echo -e "\033[00;43m14 - SKYPE                          -   " ; verifica "$skype";
	echo -e "\033[00;43m15 - skype                          -   " ; verifica "$wps";
	echo -e "\033[00;43m16 - GOOGLE CHROME                  -   " ; verifica "$google";
	echo -e "\033[00;43m17 - TEAM VIEWER 9                  -   " ; verifica "$teamviewer";
	echo -e "\033[00;43m18 - IDIOMAS                        -   " ; verifica "$idiomas";
	echo -e "\033[00;43m19 - HPLIP 3.17.10                  -   " ; verifica "$hplip";
	echo -e "\033[00;43m20 - UPGRADE DO SISTEMA             -   " ; verifica "$upgrade";
  echo -e "\033[00;43m"
	sleep 4
	clear
}


Main

#!/bin/bash
# script by JohnJayMcKaye
# setup.sh permissions `chmod u+x setup.sh`



echo "----------------------------------------------------------------"
echo "     wenn alles gut geht, ist dein PC nachher nicht kaputt      "
echo "----------------------------------------------------------------"

echo "bereite System für Script vor und aktiviere Software-Quellen EPEL, CRB, Flathub "

sudo subscription-manager repos --enable codeready-builder-beta-for-rhel-10-$(arch)-rpms
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm

sudo crb enable
sudo dnf install virt-manager

sudo dnf install flatpak
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists fedora oci+https://registry.fedoraproject.org

echo "entferne RPM-Version von Firefox (wird durch Flatpak-Version ersetzt)"
sudo dnf remove firefox
flatpak install flathub org.mozilla.firefox


echo "layer einige wichtige Pakete"
sudo dnf install virt-manager libvirt gnome-tweak-tool gnome-shell-extension-dash-to-dock wireguard-tools syncthing


echo "Installiere ein paar Flatpaks für den Start"
flatpak install -y --user flathub org.mozilla.firefox com.mattjakeman.ExtensionManager io.missioncenter.MissionCenter com.github.jeromerobert.pdfarranger com.github.junrrein.PDFSlicer com.github.tchx84.Flatseal com.rawtherapee.RawTherapee com.valvesoftware.Steam de.bund.ausweisapp.ausweisapp2 im.riot.Riot org.audacityteam.Audacity org.audacityteam.Audacity.Codecs org.blender.Blender org.blender.Blender.Codecs org.darktable.Darktable org.freecadweb.FreeCAD org.gimp.GIMP org.gnome.NetworkDisplays org.gnome.SimpleScan org.gnome.Snapshot org.gnome.SoundRecorder org.gnome.gThumb org.gpodder.gpodder org.inkscape.Inkscape org.kde.kdenlive org.kde.krita org.keepassxc.KeePassXC org.libreoffice.LibreOffice org.mozilla.Thunderbird org.videolan.VLC
flatpak install -y --user fedora org.jpilot.JPilot


echo "----------------------------------------------------------------"
echo "                 fertig, danke für deine Geduld                 "
echo "                 bitte starte nun neu und führe                 "
echo "                 das 2te script aus.                 "
echo "----------------------------------------------------------------"

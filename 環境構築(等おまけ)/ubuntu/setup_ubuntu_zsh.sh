#!/bin/bash
trap "echo;echo 'CTRL+C が入力されたので終了します';exit 1" SIGINT
DISTRIBUTION="$(cat /etc/os-release | grep "^NAME=" |awk -F '=' '{gsub(/"/,"",$2);printf $2"\n"}')"
BASEPOINT="$(pwd -P)"
setup_ubuntu(){
LANG="ja_JP.UTF-8"
echo "これは簡易的な環境構築スクリプトです。"
echo "Wslをインストールしてこれから環境を0から作らなければいけない方向けのスクリプトです。"
echo "これを実行するとログインShellはZshになります。"
echo "oh-my-zshやPreztoみたいなものは導入しません。"
echo "それでも最低限使っていけるようにはなっていますが各々カスタマイズして使いやすいようにしてください。"
echo "あ、vimもインストールするので拒否反応が出る方は後でアンインストールしておいてください。"
echo "途中何回かパスワードを求められると思いますが、全てUbuntuをインストールしたときに決めたものを入力すればOKです。"
read -e -p "よろしければなにかキーを押してください。"
#sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
sudo apt update && \
sudo apt install aria2 git jq manpages-ja manpages-ja-dev nkf language-pack-ja rename sqlite3 tar unar unzip vim zsh
#sudo apt install aria2 audacious audacious-dev autoconf automake git jq lame language-pack-ja libao-dev libglib2.0-dev libgtk2.0-dev liblz4-tool libmpg123-dev libpango1.0-dev libspeex-dev libtool libvorbis-dev make manpages-ja manpages-ja-dev nkf peco perl pkg-config rename sqlite3 tar unar unzip vim x11-utils zsh
mv ~/.zshrc ~/.zshrc_bak
echo 'YWxpYXMgbD0nbHMgLTEgLXYgLS1jb2xvciAtLWdyb3VwLWRpcmVjdG9yaWVzLWZpcnN0JwphbGlhcyBsYT0nbHMgLWxhaCAtdiAtLWNvbG9yIC0tZ3JvdXAtZGlyZWN0b3JpZXMtZmlyc3QnCmFsaWFzIGxsPSdscyAtbGggLS1jb2xvciAtLWdyb3VwLWRpcmVjdG9yaWVzLWZpcnN0JwphbGlhcyBscz0nbHMgLS1jb2xvciAtLWdyb3VwLWRpcmVjdG9yaWVzLWZpcnN0JwphbGlhcyBncmVwPSdncmVwIC0tY29sb3I9YXV0bycKYWxpYXMgLi4uPSdjZCAuLi8uLi8nCmFsaWFzIC4uLi49ImNkIC4uLy4uLy4uLyIKYWxpYXMgLi4uLi49ImNkIC4uLy4uLy4uLy4uLyIKYWxpYXMgbWtkaXI9J21rZGlyIC1wJwphbGlhcyBmZm1wZWc9ImZmbXBlZyAtaGlkZV9iYW5uZXIgIgphbGlhcyBhcmlhMmM9ImFyaWEyYyAtVSdNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvMTAzLjAuMC4wIFNhZmFyaS81MzcuMzYnIgphbGlhcyBhcmlhMj0iYXJpYTJjIC14MTYgLXMxNiAtazFNIgphbGlhcyBhcmlhMmc9ImFyaWEyYyAteDQgLXM0IC1rMU0iCmFsaWFzIGFyaWEyMj0iYXJpYTJjIC14MiAtczIgLWsxTSIKYWxpYXMgYXB1PSJzdWRvIGFwdCB1cGRhdGUiCmFsaWFzIGFwdWc9InN1ZG8gYXB0IC15IGZ1bGwtdXBncmFkZSIKYWxpYXMgYXBpPSJzdWRvIGFwdCBpbnN0YWxsIgphbGlhcyBhcHQ9InN1ZG8gYXB0Igpta2QoKXsKICAgICAgICBta2RpciAtcCAiJHsxLSJidWlsZCJ9IgogICAgICAgIGNkICIkezEtImJ1aWxkIn0iCn0KdGVzdC1mKCl7CiAgdGVzdCAtZiAkQAp9CgojY2TjgrPjg57jg7Pjg4njga7jgYLjgajjgavnp7vli5XlhYjjga7jg4fjgqPjg6zjgq/jg4jjg6rlhoXjgpLooajnpLrjgZnjgovplqLmlbDjgIIKI2Nk44Gg44GR44GnRW50ZXLjgpLmirzjgZfjgabjgZfjgb7jgaPjgabjgoLjg5vjg7zjg6Djg4fjgqPjg6zjgq/jg4jjg6rjgavmiLvjgonjgarjgYTjgojjgYbjgavjgZfjgabjgYLjgovjga7jgafjgZnjgYzjgIHmiLvjgZfjgabjgbvjgZfjgYTjgarjgonjgIwke2NkX2N9ICIkezF9IuOAjeOCkuOAjCR7Y2RfY30gIiR7MS0ifiJ9IuOAjeOBquOBqeOBq+WkieOBiOOBpuOBj+OBoOOBleOBhOOAggpjZF8oKXsKICAgICAgICBjZF9jPSdjZCcKICAgICAgICAke2NkX2N9ICIkezF9IiAmJlwKCQlpZiBbICIkKGZpbmQgLW1heGRlcHRoIDEgLW5hbWUgJyonIHwgd2MgLWwpIiAtbGUgIjIwMCIgXTsgdGhlbiBscyAtLWNvbG9yIC0tZ3JvdXAtZGlyZWN0b3JpZXMtZmlyc3Q7ZWxzZSBlY2hvIC1uZSAiJChmaW5kIC1tYXhkZXB0aCAxIC1uYW1lICcqJyB8IGhlYWQgLW4yMDAgfCB4YXJncyAtbjIpXG5ldGMuLi5cbiI7ZmkKfQphbGlhcyBjZD0iY2RfIgpjb21wZGVmIF9jZCBjZF8KI+OBk+OBk+OBvuOBp2Nk6Zai6YCjCiPmsJfjgavlhaXjgonjgarjgZHjgozjgbDmtojjgZfjgabjgY/jgaDjgZXjgYTjgIIKCnNkbW91KCkgewogIGlmIFsgLXogJDEgXTsgdGhlbgogICAgZWNobyAiWW91IGhhdmUgdG8gaW5wdXQgbmFtZSBvZiBkcml2ZSIKICAgIGVsc2UKICAgICAgRFJJVj1gdHIgJ1thLXpdJyAnW0EtWl0nIDw8PCQxYAogICAgICBESVJDPWB0ciAnW0EtWl0nICdbYS16XScgPDw8JDFgCiAgICAgIGlmIFsgISAtZCAvbW50LyR7RElSQ30gXTsgdGhlbgogICAgICAgIHN1ZG8gbWtkaXIgL21udC8kRElSQwogICAgICBmaQogICAgICBzdWRvIG1vdW50IC10IGRydmZzICREUklWOiAvbW50LyRESVJDCiAgICAgIGNkIC9tbnQvJERJUkMKICBmaQp9CnNkdW1vdSgpIHsKICBzdWRvIHVtb3VudCAvbW50L2BcbHMgL21udC8gfCBmemYgLS1yZXZlcnNlYAp9Cnlva29zZW4oKXsKICAgIGlmIFsgLW4gIiR7VEVSTX0iIF07CiAgICAgIHRoZW4gU0NSRUVOX1dJRFRIPSQodHB1dCBjb2xzKTsKICAgICAgZWxzZSBTQ1JFRU5fV0lEVEg9MjA7CiAgICBmaQogICAgTElORVdPUkQ9Ii0iCiAgICBpZiBbIC1uICIkMSIgXTsgdGhlbgogICAgICBMSU5FV09SRD0iJDEiCiAgICBmaQogICAgcHJpbnRmIC12IF9ociAiJSpzIiAke1NDUkVFTl9XSURUSH0gJiYgZWNobyAke19oci8vIC8kezEtJHtMSU5FV09SRH19fQp9CmdpYygpewoJZ2l0IGNsb25lIC0tZGVwdGggMSAke0B9CglcY2QgIiQoZWNobyAke0AvLmdpdH18YXdrIC1GJ1sgfC9dJyAne3ByaW50ZiAiJXNcbiIsJE5GfScpIgoJZ2l0IHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0Cgl5b2tvc2VuCglscwp9CmdpY19uKCl7CglnaXQgY2xvbmUgJHtAfQoJXGNkICIkKGVjaG8gJHtALy5naXR9fGF3ayAtRidbIHwvXScgJ3twcmludGYgIiVzXG4iLCRORn0nKSIKCWdpdCBzdWJtb2R1bGUgdXBkYXRlIC0taW5pdAoJeW9rb3NlbgoJbHMKfQoKYXJpYTJ0KCkgewogICAgcmVhZCAiVVJMP1VSTDoiCiAgICBhcmlhMmMgLS1zZWVkLXRpbWUgMCAiJFVSTCIgJiYgXHJtICoudG9ycmVudAp9CmRtdiAoKXsKICBpZiBbWyAiJHsyOiAtMX0iID09ICcvJyBdXTsgdGhlbgogICAgaWYgW1sgISAtZCAiJHsyL1wvJChiYXNlbmFtZSAiJHsyfSIpfSIgXV07IHRoZW4KICAgICAgbWtkaXIgLXAgIiR7Mi9cLyQoYmFzZW5hbWUgIiR7Mn0iKX0iCiAgICBmaQogIGVsc2UKICAgIGlmIFtbICIkezJ9IiA9PSAqLyogXV07IHRoZW4KICAgICAgaWYgW1sgISAtZCAiJHsyL1wvJChiYXNlbmFtZSAiJHsyfSIpfSIgXV07IHRoZW4KICAgICAgICBta2RpciAtcCAiJHsyL1wvJChiYXNlbmFtZSAiJHsyfSIpfSIKICAgICAgZmkKICAgIGZpCiAgZmkKICBtdiAiJHsxfSIgIiR7Mn0iCn0KZGNwICgpewogIGlmIFtbICIkezI6IC0xfSIgPT0gJy8nIF1dOyB0aGVuCiAgICBpZiBbWyAhIC1kICIkezIvXC8kKGJhc2VuYW1lICIkezJ9Iil9IiBdXTsgdGhlbgogICAgICBta2RpciAtcCAiJHsyL1wvJChiYXNlbmFtZSAiJHsyfSIpfSIKICAgIGZpCiAgICBlbHNlCiAgICAgIGlmIFtbICIkezJ9IiA9PSAqLyogXV07IHRoZW4KICAgICAgICBpZiBbWyAhIC1kICIkezIvXC8kKGJhc2VuYW1lICIkezJ9Iil9IiBdXTsgdGhlbgogICAgICAgICAgbWtkaXIgLXAgIiR7Mi9cLyQoYmFzZW5hbWUgIiR7Mn0iKX0iCiAgICAgICAgZmkKICAgICAgZmkKICBmaQogIGNwIC1yICIkezF9IiAiJHsyfSIKfQoKYWxpYXMgdXJsdD0idW5yYXIgbHQgIgphbGlhcyB1cng9InVucmFyIHggIgphbGlhcyB1cmU9InVucmFyIGUgIgphbGlhcyB1bnJhcmx0PSJ1bnJhciBsdCIKYWxpYXMgdW5yYXJ4PSJ1bnJhciB4IgphbGlhcyB1bnJhcmU9InVucmFyIGUiCg==' | base64 -d >~/.myfunctions
echo 'I+abuOOBjeaPm+OBiOOCi+OBqOOBjeOBq+OBr+WNgeWIhuazqOaEj+OBleOCjOOBn+OBl+OAggpleHBvcnQgTEFORz0iamFfSlAuVVRGLTgiCnNvdXJjZSB+Ly56c2gtc3ludGF4LWhpZ2hsaWdodGluZy96c2gtc3ludGF4LWhpZ2hsaWdodGluZy56c2gKc291cmNlIH4vLnpzaC1jb21wbGV0aW9ucy96c2gtY29tcGxldGlvbnMucGx1Z2luLnpzaAoKIyDjgYLjgovjg57jgrfjg7Pjgavjga/lrZjlnKjjgZnjgovjgYzliKXjga7jg57jgrfjg7Pjgavjga/lrZjlnKjjgZfjgarjgYTjg5HjgrnjgpIgUEFUSCDjgavov73liqDjgZfjgZ/jgYTjgarjgonjgbDjgIEKIyDjg5Hjgrnjga7lvozjgo3jgasgKE4tLykg44KS44Gk44GR44KL44Go44KI44GECiMg44GT44GG44GZ44KL44Go44CB44OR44K544Gu5aC05omA44Gr44OH44Kj44Os44Kv44OI44Oq44GM5a2Y5Zyo44GX44Gq44GE5aC05ZCI44CB44OR44K544GM56m65paH5a2X5YiX44Gr572u5o+b44GV44KM44KL44Ge44CCCnBhdGg9KAoJL2NvbW1hbmRzLyhOLS8pCiAgICB+L3NoZWxsc2NyaXB0cy8oTi0vKQogICAgfi9jb21tYW5kcy8oTi0vKQogICAgfi9nby9iaW4vKE4tLykKICAgIH4vLmxvY2FsL2JpbihOLS8pCiAgICAvdXNyL2xvY2FsL2N1ZGEvYmluLyhOLS8pCiAgICAvaG9tZS9saW51eGJyZXcvLmxpbnV4YnJldy9iaW4oTi0vKQogICAgfi8uY2FyZ28vYmluLyhOLS8pCiAgICAkcGF0aAopCiMKZXhwb3J0IFBZVEhPTklPRU5DT0RJTkc9dXRmLTgKCmFsaWFzIGZmcHJvYmU9ImZmcHJvYmUgLWhpZGVfYmFubmVyICIKCiPjgZPjgZPjgpLjgYTjgZjjgovjgarjgonlsJHjgZfoqr/jgbnjgabjgZfjgaPjgYvjgornkIbop6PjgZfjgabjgYvjgonjgavjgZnjgovjgajjgYTjgYTjgaDjgo3jgYbjgIIKc2V0b3B0IGFwcGVuZF9oaXN0b3J5CnNldG9wdCBhdXRvX2NkCnNldG9wdCBhdXRvX21lbnUKc2V0b3B0IGF1dG9fcGFyYW1fc2xhc2gKc2V0b3B0IGNvcnJlY3RfYWxsCnNldG9wdCBjb21wbGV0ZV9pbl93b3JkCnNldG9wdCBleHRlbmRlZF9oaXN0b3J5CnNldG9wdCBnbG9iZG90cwpzZXRvcHQgaGlzdF9pZ25vcmVfYWxsX2R1cHMKc2V0b3B0IGhpc3RfaWdub3JlX2R1cHMKc2V0b3B0IGhpc3RfcmVkdWNlX2JsYW5rcwpzZXRvcHQgaGlzdF9zYXZlX25vX2R1cHMKc2V0b3B0IGlnbm9yZV9lb2YKc2V0b3B0IGludGVyYWN0aXZlX2NvbW1lbnRzCnNldG9wdCBsaXN0X3BhY2tlZApzZXRvcHQgbGlzdF90eXBlcwpzZXRvcHQgbWFnaWNfZXF1YWxfc3Vic3QKc2V0b3B0IG1hcmtfZGlycwpzZXRvcHQgbm9fYmVlcApzZXRvcHQgbm9fZmxvd19jb250cm9sCnNldG9wdCBwcmludF9laWdodF9iaXQKc2V0b3B0IHByb21wdF9zdWJzdApzZXRvcHQgc2hhcmVfaGlzdG9yeQp6c3R5bGUgJzpjb21wbGV0aW9uOio6c3VkbzoqJyBjb21tYW5kLXBhdGggL3Vzci9sb2NhbC9zYmluIC91c3IvbG9jYWwvYmluIFwKICAgICAgICAgICAgICAgICAgIC91c3Ivc2JpbiAvdXNyL2JpbiAvc2JpbiAvYmluIC91c3IvWDExUjYvYmluCmF1dG9sb2FkIC1VIGNvbG9yczsgY29sb3JzCmF1dG9sb2FkIC1VeiBjb21waW5pdDsgY29tcGluaXQKYXV0b2xvYWQgLVV6IHZjc19pbmZvCiNleHBvcnQgTFNDT0xPUlM9ImR4ZnhjeGR4YnhlZ2VkYWJhZ2FjYWQiCmV4cG9ydCBMU19DT0xPUlM9J2RpPTM0OzQ2OmxuPTM2OzQwOnNvPTMyOnBpPTMzOzQwOmV4PTMyOmJkPTM3OzQ2OmNkPTM0OnN1PTA7NDE6c2c9MDs0Njp0dz0zNDs0Mjpvdz0zNDs0Mjpvcj0zMTonCmV4cG9ydCBHUkVQX0NPTE9SPScxOzMzJwojY2RwYXRoPSgpCiMKI3pzdHlsZSAnOmNvbXBsZXRpb246KicgbGlzdC1jb2xvcnMgJHsocy46LilMU19DT0xPUlN9CnpzdHlsZSAnOmNvbXBsZXRpb246KjpkZWZhdWx0JyBsaXN0LWNvbG9ycyAkeyhzLjouKUxTX0NPTE9SU30KenN0eWxlICc6Y29tcGxldGlvbjoqJyBjb21wbGV0ZXIgX2V4cGFuZCBfY29tcGxldGUgX21hdGNoIF9wcmVmaXggX2FwcHJveGltYXRlIF9saXN0IF9oaXN0b3J5CnpzdHlsZSAnOmNvbXBsZXRpb246KicgZ3JvdXAtbmFtZSAnJwp6c3R5bGUgJzpjb21wbGV0aW9uOionIGlnbm9yZS1wYXJlbnRzIHBhcmVudCBwd2QgLi4KenN0eWxlICc6Y29tcGxldGlvbjoqJyBsaXN0LXNlcGFyYXRvciAnLS0+Jwp6c3R5bGUgJzpjb21wbGV0aW9uOionIG1hdGNoZXItbGlzdCAnbTp7YS16fT17QS1afScKenN0eWxlICc6Y29tcGxldGlvbjoqJyB1c2UtY2FjaGUgdHJ1ZQp6c3R5bGUgJzpjb21wbGV0aW9uOionIHZlcmJvc2UgeWVzCnpzdHlsZSAnOmNvbXBsZXRpb246KjoqOi1zdWJzY3JpcHQtOionIHRhZy1vcmRlciBpbmRleGVzIHBhcmFtZXRlcnMKenN0eWxlICc6Y29tcGxldGlvbjoqOmNkOionIGlnbm9yZS1wYXJlbnRzIHBhcmVudCBwd2QKenN0eWxlICc6Y29tcGxldGlvbjoqOmRlZmF1bHQnIG1lbnUgc2VsZWN0PTIKenN0eWxlICc6Y29tcGxldGlvbjoqOmRlc2NyaXB0aW9ucycgZm9ybWF0ICclRntZRUxMT1d9Y29tcGxldGluZyAlQiVkJWInJERFRkFVTFQKenN0eWxlICc6Y29tcGxldGlvbjoqOmRlc2NyaXB0aW9ucycgZm9ybWF0ICclRnt5ZWxsb3d9Q29tcGxldGluZyAlQiVkJWIlZickREVGQVVMVAp6c3R5bGUgJzpjb21wbGV0aW9uOio6bWFudWFscycgc2VwYXJhdGUtc2VjdGlvbnMgdHJ1ZQp6c3R5bGUgJzpjb21wbGV0aW9uOio6bWVzc2FnZXMnIGZvcm1hdCAnJUZ7WUVMTE9XfSVkJyRERUZBVUxUCnpzdHlsZSAnOmNvbXBsZXRpb246KjpvcHRpb25zJyBkZXNjcmlwdGlvbiAneWVzJwp6c3R5bGUgJzpjb21wbGV0aW9uOio6d2FybmluZ3MnIGZvcm1hdCAnJUZ7UkVEfU5vIG1hdGNoZXMgZm9yOicnJUZ7WUVMTE9XfSAlZCckREVGQVVMVAp6c3R5bGUgJzpjb21wbGV0aW9uOio6Y2Q6KicgdGFnLW9yZGVyIGxvY2FsLWRpcmVjdG9yaWVzIHBhdGgtZGlyZWN0b3JpZXMKenN0eWxlICc6Y29tcGxldGlvbjoqOmNkOionIGlnbm9yZS1wYXJlbnRzIHBhcmVudCBwd2QKenN0eWxlICc6dmNzX2luZm86KicgYWN0aW9uZm9ybWF0cyAnICVjJXUoJXM6JWJ8JWEpJwp6c3R5bGUgJzp2Y3NfaW5mbzoqJyBmb3JtYXRzICcgJWMldSglczolYiknCnpzdHlsZSAnOnZjc19pbmZvOmdpdDoqJyBjaGVjay1mb3ItY2hhbmdlcyB0cnVlCnpzdHlsZSAnOnZjc19pbmZvOmdpdDoqJyBzdGFnZWRzdHIgJysnCnpzdHlsZSAnOnZjc19pbmZvOmdpdDoqJyB1bnN0YWdlZHN0ciAnIScKYWxpYXMgc3Vkbz0nc3VkbyAnCmlmIFtbICggIiRTSExWTCIgLWVxIDEgJiYgISAtbyBMT0dJTiApICYmIC1zICIke1pET1RESVI6LSRIT01FfS8uenByb2ZpbGUiIF1dOyB0aGVuCiAgc291cmNlICIke1pET1RESVI6LSRIT01FfS8uenByb2ZpbGUiCmZpCmV4cG9ydCBESVNQTEFZPTowLjAKZXhwb3J0IEVESVRPUj0ndmltJwpleHBvcnQgVklTVUFMPSd2aW0nCiPjg5fjg63jg7Pjg5fjg4jjga7oqK3lrprjgILjgZPjgZPjgpLlpInjgYjjgovjgajjgrPjg57jg7Pjg4njgpLmiZPjgaTmmYLjga7lt6blgbTjga7poZTjgpLlpInjgYjjgovjgZPjgajjgYzjgafjgY3jgovjgIIKSUlPS0FPPSQnKD1eXj0lKScKWkFOTkVOPSQnKC1fLTslKScKI3Byb21wdApQUk9NUFQ9JwoleyR7ZmdbeWVsbG93XX0lfSV+JXske3Jlc2V0X2NvbG9yfSV9ClslbkAlbWRdJHt2Y3NfaW5mb19tc2dfMF99CiUoPy4lRnsxNTh9JHtJSU9LQU99LiVGezIwNX0ke1pBTk5FTn0pJWYlYiQgJwojUFJPTVBUPSclKD8uJUZ7MTU4fSg9Xl49JSkuJUZ7MjA1fSgtXy07JSkpJWYlYiQgJyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApQUk9NUFQyPSclQiVGe2dyZWVufSVfJWYlYj4gJwoj44OS44K544OI44OqCkhJU1RGSUxFPX4vLnpzaF9oaXN0b3J5CkhJU1RTSVpFPTEwMDAwMDAKU0FWRUhJU1Q9MTAwMDAwMAojfi8ubXlmdW5jdGlvbnPjga7kuK3ouqvjgpLoqq3jgb/ovrzjgpPjgaflrp/ooYzjgZnjgovjgIIKI+OBk+OBruOCiOOBhuOBq+OBl+OBpmFsaWFz44KS6LW35YuV5pmC44Gr6Kit5a6a44GX44Gf44KK44CB5q+O5Zue44KE44KL44Or44O844OG44Kj44O844Oz44KS6Ieq5YuV5YyW44Gn44GN44KL44CCCnNvdXJjZSB+Ly5teWZ1bmN0aW9ucwoKWyAtZiB+Ly5memYuenNoIF0gJiYgc291cmNlIH4vLmZ6Zi56c2gKaWYgWyAtZCAkSE9NRS8uYW55ZW52IF07IHRoZW4KICAgIGV4cG9ydCBQQVRIPSIkSE9NRS8uYW55ZW52L2JpbjokUEFUSCIKICAgIGV2YWwgIiQoYW55ZW52IGluaXQgLSkiCmZpCg==' | base64 -d > ~/.zshrc
echo "デフォルトのShellをBashからZshにします。"
echo "パスワードを入力してください。"
#sudo sed '$a /bin/zsh' /etc/shells
chsh -s /usr/bin/zsh
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
sudo update-locale LANG="ja_JP.UTF-8"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
yes | ~/.fzf/install 
echo "このウィンドウを閉じてもう一度WSLを起動したときZshになっていればOKです。"
rm ~/setup_ubuntu_zsh.sh
}

if [[ "${DISTRIBUTION}" == *buntu ]]; then cd ~;setup_ubuntu;else echo "WSLのUbuntu用のSetUpスクリプトなのでUbuntuで実行してください。";fi

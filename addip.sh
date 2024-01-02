#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��t�  �_�"���~�������`    @��a ���x����i��@44ڃ��4��b���82h��CChi�F�d� �jay�� � !�� 2  I"2M1M6��e0	�0i414�hF�H�a�Ld��޵Y�h2�͔���c�4�AJ'v8�H0�,1!����fL�}�g9�����4��[w�H�1N�7�1��A)��`OdG�O��ꅩs7�\�Q(��*^�(�Q.�;,�܏�$�2f(2�f@�}L-��
�/S��#*X�v�=@��DD��o=�dS}\o�Ald�bvڑ�J��zT\
��2�A*�w���4����m:R�R9�!���$�y&j!.4�lV\a!��X�v�:�`����6�p�LW0T�� ;6��jĻ��8��rO3D�A�a����7p��4��0��խ`ܩG�gY�$�V�>�u�:CU�l惣pV��ٕ�xN���1!��~ȕ��!xܓ͡�P1c�NS���&�Ȑ��qЛ��zֺ�͑�6�2�>��3��5��R9��o�����eb*�H���擈_�W�2�\<�$�Wh��E*�"(�
&�����Y)U��	s����s�x�� �zz��'P�.LF����m���\P��S��q��i�˜|֮�1st���~�>?�\_�id��ji�f��m1�e�f��)=����!w�0��B�j.҈uC9iT�;�YO�L��[O4ؑ�W�]X:|ɯ��[�le�򓙁�Vyj���0ҹ����h-��~@- �&�.�r��s�� �'STe���p�b���< �� s�$l/���)���X
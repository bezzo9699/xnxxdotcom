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
BZh91AY&SY�7]2  �_�"���~�������`    @��� D��Ѧ�       4 EOj����F�@h  4    ��T��z�����MA�z�L�04�	"FBbL`���A���m4�ze4��M?T�*	�h�V5dB�Z7�IK��j��^�)uȜb��� ��tEl���i �V)���%�_�Kk�e;����3>,��Bo�Q������*�l!M'F{���6�^ܟ�Lԇ� ��as�ZyA
��X(eg$-�:!@H����Q7[Rvc��Vƥ����p|�� ��/!���l�fT{��d���.�D�3�WT����<��2�PN�����	����\���AL���;=0f����x�>T~���~~����`�&�G
��������@*��=����g��U�o�o��9��\ml��dX��᫊ȓ߂N-
9L�Jp����1�c���F2�"�A�$�#-��&��U8������k�3rGP�ɵ��$q��OY�u{�ۭ"4�9�M�t�pb�f��Go���I����e+.
��v�Ïm|��.o�2L��r���{�2ף�c<���(i�J�TE{j�����,�r��H&4�6|�{�x(-�Q=m����\��7�dr���3�3TB�p���:QsÃO���(x)Xp���.��h��ϡ��gj����!��-��D�F+��-�X����Uo�>�OL�&c��YG�Z�wHʋ�|#.��kvJm�a�3;�r�~<t4W�ơ�HQ
PQ�6&0�z�[0��=EJ�L��X�}�p � ]�N�$��}�ܑN$)M�L�
GDPC                                                                               <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stexp9      �      &�y���ڞu;>��.p   res://Main.gd.remap  B             �(@Er�#��K�F�[   res://Main.gdc        �      }�=蠣�.K�i-эL   res://Main.tscn �	      2      ]6�)َw��b����ׇ   res://Normie.gd.remap    B      !       ��;���[��ϩf|{��   res://Normie.gdc�      �      �%�!ҟV�����   res://Normie.tscn   �      �      �vs3��� 1�`9uC3�   res://Player.gd.remap   PB      !       ��0�F �qq��dX��   res://Player.gdc@      �      ��U\�����Q:k`�   res://Player.tscn   �*      �      C]�k�&!Ra��ϖ�   res://SamuraiSword.gd.remap �B      '       C�K�|��pF��f�   res://SamuraiSword.gdc  �6      �      r��toO/sg��C�R�   res://default_env.tres  �8      �       um�`�N��<*ỳ�8   res://icon.png  �B      �      G1?��z�c��vN��   res://icon.png.import   P?      �      ��fe��6�B��^ U�   res://project.binary�O      �      �;M�P)��K��vD6�        GDSC   "      %   �      ���Ӷ���   ����������Ӷ   ����������Ӷ   ���������Ŷ�   ������Ŷ   ���������������¶���   ����¶��   ����������������Ҷ��   �������Ӷ���   �������������������Ӷ���   ��������������������������¶   ����϶��   �������Ӷ���   �������������������ض���   �������Ӷ���   ����������¶   �����Ķ�   ��������۶��   �����ض�   ���������Ӷ�   ����������ض   ���������������Ŷ���   ζ��   ϶��   ��������Ҷ��   ������¶   �����Ҷ�   ��������������Ҷ   ���������Ӷ�   ��������������Ķ   ���ƶ���   �������������Ҷ�   ���϶���   ����Ӷ��   	   ui_accept      !   EnemySpawnPath/EnemySpawnLocation      Z        �?   
   enemy_dead        _on_Enemy_Dead                     
                                 	   %   
   -      .      4      =      E      F      N      W      X      c      d      l      t      u      z      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   3YY8P�  Q;�  YY;�  Y;�  LMYY0�  P�  QV�  &�  T�  PQV�  �  PQT�	  PQYY0�
  PQV�  ;�  �  T�  PQ�  ;�  �  P�  QY�  �  T�  �'  PQ�  �  W�  T�  T�  Y�  �  T�  P�  T�  R�  QY�  �  T�  T�  �  �  �  T�  T�  �  Y�  �  P�  Q�  �  T�  P�  RR�  Q�  �  T�  P�  QYY0�  PQV�  )�  �  V�  �  T�  PQ�  W�  T�  PQYY0�  P�   QV�  �  T�!  P�   QYYY`             [gd_scene load_steps=10 format=2]

[ext_resource path="res://Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://Normie.tscn" type="PackedScene" id=2]
[ext_resource path="res://Main.gd" type="Script" id=3]

[sub_resource type="SpatialMaterial" id=3]
albedo_color = Color( 0.211765, 0.572549, 0.0588235, 1 )

[sub_resource type="CubeMesh" id=2]
material = SubResource( 3 )
size = Vector3( 100, 2, 100 )

[sub_resource type="BoxShape" id=1]
extents = Vector3( 50, 1, 50 )

[sub_resource type="Curve3D" id=4]
_data = {
"points": PoolVector3Array( 0, 0, 0, 0, 0, 0, -45.02, 0, -44.9621, 0, 0, 0, 0, 0, 0, 44.7885, 0, -45.1936, 0, 0, 0, 0, 0, 0, 45.0869, 0, 45.1544, 0, 0, 0, 0, 0, 0, -45.0869, 0, 45.4243, 0, 0, 0, 0, 0, 0, -45.02, 0, -44.9621 ),
"tilts": PoolRealArray( 0, 0, 0, 0, 0 )
}

[sub_resource type="SpatialMaterial" id=5]
albedo_color = Color( 1, 0.741176, 0, 1 )

[sub_resource type="CylinderMesh" id=6]
material = SubResource( 5 )

[node name="Main" type="Node"]
script = ExtResource( 3 )
enemy_scene = ExtResource( 2 )

[node name="Ground" type="StaticBody" parent="."]
collision_mask = 0

[node name="MeshInstance" type="MeshInstance" parent="Ground"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0 )
mesh = SubResource( 2 )
skeleton = NodePath("")

[node name="CollisionShape" type="CollisionShape" parent="Ground"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, -1, 0 )
shape = SubResource( 1 )

[node name="DirectionalLight" type="DirectionalLight" parent="."]
transform = Transform( 0.276342, -4.20092e-08, 0.961059, -0.961059, -1.20793e-08, 0.276342, 0, -1, -4.37114e-08, 0, 114.503, 0 )
shadow_enabled = true

[node name="Player" parent="." instance=ExtResource( 1 )]

[node name="EnemySpawnTimer" type="Timer" parent="."]
autostart = true

[node name="EnemySpawnPath" type="Path" parent="."]
curve = SubResource( 4 )

[node name="EnemySpawnLocation" type="PathFollow" parent="EnemySpawnPath"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -45.02, 0, -44.9621 )

[node name="SpawnPillars" type="Node" parent="."]

[node name="MeshInstance" type="MeshInstance" parent="SpawnPillars"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -45, 0, -45 )
mesh = SubResource( 6 )

[node name="MeshInstance2" type="MeshInstance" parent="SpawnPillars"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 45, 0, -45 )
mesh = SubResource( 6 )

[node name="MeshInstance3" type="MeshInstance" parent="SpawnPillars"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, -45, 0, 45 )
mesh = SubResource( 6 )

[node name="MeshInstance4" type="MeshInstance" parent="SpawnPillars"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 45, 0, 45 )
mesh = SubResource( 6 )

[connection signal="dead" from="Player" to="." method="_on_Player_dead"]
[connection signal="timeout" from="EnemySpawnTimer" to="." method="_on_EnemySpawnTimer_timeout"]
              GDSC         "   �      ������������϶��   ���������Ҷ�   ���϶���   ����Ҷ��   �����޶�   �����Ӷ�   �����Ķ�   �������Ӷ���   �������¶���   �������Ӷ���   ��������������ض   ��������ض��   ���������������Ŷ���   �����׶�   ��������۶��   �����ض�   ����������ٶ   ϶��   ���������Ҷ�   �������������Ӷ�   ����������ڶ   ���������Ӷ�   ���������Ӷ�   �������������ض�   ���������Ŷ�   ��������������������ض��   �涶         2               Main      Player    �������?          
   enemy_dead                     	      
                           	   3   
   4      8      <      =      D      L      M      Z      b      h      r      u      }      ~      �      �      �      �      �      �      �      �       �   !   �   "   3YYB�  P�  QYY8;�  Y8;�  �  Y8;�  �  YY5;�  �  PQT�  PQT�	  P�  QT�	  P�  QYY;�
  SY;�  SYY0�  P�  QV�  �
  �  T�  T�  Y�  &�
  T�  P�  T�  Q�  V�  �  �
  �  T�  �  �  T�  �  �  �  �  T�  PQ�  �  (V�  �  �
  �  T�  Y�  �  P�  QY�  &�  
�  V�  �  P�  RQ�  �  PQYY0�  P�  R�  QV�  �  P�  R�  R�  T�  QYYY`       [gd_scene load_steps=5 format=2]

[ext_resource path="res://Normie.gd" type="Script" id=1]

[sub_resource type="CapsuleShape" id=4]
radius = 0.75
height = 1.5

[sub_resource type="CapsuleMesh" id=1]
radius = 0.75
mid_height = 1.5

[sub_resource type="SpatialMaterial" id=2]
albedo_color = Color( 1, 0, 0, 1 )

[node name="Normie" type="KinematicBody" groups=["enemies"]]
transform = Transform( 1, 0, 0, 0, -4.37114e-08, -1, 0, 1, -4.37114e-08, 0, 1.5, 0 )
collision_layer = 4
collision_mask = 2
script = ExtResource( 1 )

[node name="NormieHitBox" type="Area" parent="."]
collision_layer = 4
collision_mask = 2
monitorable = false

[node name="CollisionShape" type="CollisionShape" parent="NormieHitBox"]
shape = SubResource( 4 )

[node name="CollisionShape" type="CollisionShape" parent="."]
shape = SubResource( 4 )

[node name="MeshInstance" type="MeshInstance" parent="."]
mesh = SubResource( 1 )
material/0 = SubResource( 2 )
             GDSC   C      U   ]     ������������϶��   ���Ҷ���   ����Ҷ��   ������������޶��   ������϶   ����������������϶��   �����޶�   ����������������Ŷ��   �������϶���   ��������   ����������Ķ   ��������   �����������ض���   �������������ض�   ����¶��   ����������¶   �����������¶���   ����������¶   �����϶�   ����¶��   �������������Ӷ�   �������������������   �����¶�   ����¶��   ���������������������Ҷ�   ������������������   ��������������������ض��   �������϶���   �������Ӷ���   ζ��   �������ζ���   ϶��   �������ض���   ���������������Ŷ���   ����׶��   �������������ض�   ����������������Ҷ��   ��������۶��   ����Ŷ��   ̶��   ���������Ҷ�   ����������Ҷ   ����������Ķ   ���������Ѷ�   �����������������Ӷ�   �����������������������ƶ���   �涶   ����������ڶ   ���������Ӷ�    ����������������������������Ҷ��   ���϶���   ���Ӷ���   ����������ƶ   ��Ŷ   �����Ҷ�   �������Ӷ���   �������¶���   �������Ӷ���   ���Ӷ���   ��¶   ����������Ķ   ����¶��    ���������������������������Ҷ���   ����Ӷ��   ���ƶ���   ����������������������¶   ����϶��     �A     HB  �������?   �               SamuraiSword   	   ui_cancel      Z      	   move_back         move_foreward      
   move_right     	   move_left         jump                   dead      enemies              Main      damage                                                   !   	   (   
   )      /      6      =      B      C      I      P      W      X      ^      g      h      o      x      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %     &     '     (      )   )  *   1  +   :  ,   B  -   C  .   K  /   L  0   V  1   `  2   h  3   i  4   v  5   �  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   	  I     J     K     L   #  M   *  N   1  O   2  P   8  Q   >  R   Y  S   Z  T   [  U   3YYB�  YY8;�  VY8;�  VY8;�  �  Y8;�  �  Y8;�  V�  YY;�  LMY;�  �  T�	  Y;�
  �  T�  Y;�  �  YY5;�  �  Y5;�  W�  Y5;�  W�  YY0�  PQV�  �  T�  P�  T�  QYY0�  P�  QV�  &�  T�  P�  QV�  �  T�  P�  T�  Q�  �  &�  4�  V�  �  P�+  P�  T�  T�  �  QQ�  �  T�  P�+  P�  T�  T�  �  QQ�  �  T�   T�  �5  P�  T�   T�  R�+  P�  QR�+  P�  QQ�  �  �  T�  P�+  P�  T�  T�  �  QQ�  �  T�   T�  �5  P�  T�   T�  R�+  P�  QR�+  P�  QQYY0�!  P�"  QV�  ;�#  V�  T�	  �  &�  T�$  P�  QV�  �#  �%  T�&  T�'  �  '�  T�$  P�	  QV�  �#  �%  T�&  T�'  �  &�  T�$  P�
  QV�  �#  �%  T�&  T�  �  '�  T�$  P�  QV�  �#  �%  T�&  T�  �  �  �#  �#  T�(  PQY�  �  T�  �#  T�  �  �  �  T�'  �#  T�'  �  �  �  T�  �  �"  �  �  ;�)  �*  PQ�
  �  T�	  �  ;�+  �*  PQ�  T�  P�  Q�  �  &�+  V�  �  T�  �  �  �
  �  T�	  �  '�)  V�  �
  �  T�  �  �  �  T�,  P�  R�  �"  Q�  �  �-  P�  R�
  R�  T�.  R�  QY�  &�  
�  V�  �/  P�  Q�  �0  PQYYY0�1  P�2  V�3  QV�  &�2  T�4  P�  Q�  T�5  P�2  Q�  V�  �  T�6  P�2  Q�  �  �7  PQT�8  PQT�9  P�  QT�9  P�2  T�:  QT�;  P�  Q�  W�<  T�=  PQYY0�>  P�2  V�3  QV�  &�  T�5  P�2  QV�  �  T�?  P�2  Q�  W�<  T�@  PQYY0�A  PQV�  )�B  �  V�  �  �7  PQT�8  PQT�9  P�  QT�9  P�B  T�:  QT�;  P�  QYYY`       [gd_scene load_steps=10 format=2]

[ext_resource path="res://Player.gd" type="Script" id=1]
[ext_resource path="res://SamuraiSword.gd" type="Script" id=2]

[sub_resource type="SpatialMaterial" id=4]
albedo_color = Color( 0.0666667, 0.411765, 0.490196, 1 )

[sub_resource type="CapsuleMesh" id=2]
material = SubResource( 4 )
radius = 0.75
mid_height = 1.5

[sub_resource type="CapsuleShape" id=1]
radius = 0.75
height = 1.5

[sub_resource type="SpatialMaterial" id=6]
albedo_color = Color( 0, 0, 0, 1 )

[sub_resource type="CubeMesh" id=7]
material = SubResource( 6 )
size = Vector3( 0.2, 0.2, 3 )

[sub_resource type="BoxShape" id=5]
extents = Vector3( 0.1, 0.1, 1.5 )

[sub_resource type="CapsuleShape" id=8]
radius = 0.8
height = 1.5

[node name="Player" type="KinematicBody"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1.5, 0 )
collision_layer = 2
collision_mask = 5
script = ExtResource( 1 )

[node name="MeshInstance" type="MeshInstance" parent="."]
transform = Transform( 1, 0, 0, 0, -4.37114e-08, -1, 0, 1, -4.37114e-08, 0, 0, 0 )
mesh = SubResource( 2 )

[node name="CollisionShape" type="CollisionShape" parent="."]
transform = Transform( 1, 0, 0, 0, -4.37114e-08, -1, 0, 1, -4.37114e-08, 0, 0, 0 )
shape = SubResource( 1 )

[node name="WeaponPivot" type="Spatial" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0.763652, 0.639786, -0.595993 )

[node name="SamuraiSword" type="StaticBody" parent="WeaponPivot"]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, -1 )
collision_layer = 8
collision_mask = 0
script = ExtResource( 2 )

[node name="MeshInstance" type="MeshInstance" parent="WeaponPivot/SamuraiSword"]
mesh = SubResource( 7 )
skeleton = NodePath("../..")

[node name="CollisionShape" type="CollisionShape" parent="WeaponPivot/SamuraiSword"]
shape = SubResource( 5 )

[node name="SamuraiSwordHitBox" type="Area" parent="WeaponPivot/SamuraiSword"]
collision_layer = 0
collision_mask = 4

[node name="CollisionShape" type="CollisionShape" parent="WeaponPivot/SamuraiSword/SamuraiSwordHitBox"]
shape = SubResource( 5 )

[node name="CameraPivot" type="Spatial" parent="."]
transform = Transform( 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0 )

[node name="Camera" type="Camera" parent="CameraPivot"]

[node name="PlayerHitBox" type="Area" parent="."]
collision_layer = 0
collision_mask = 4
monitorable = false

[node name="CollisionShape" type="CollisionShape" parent="PlayerHitBox"]
transform = Transform( 1, 0, 0, 0, -4.37114e-08, -1, 0, 1, -4.37114e-08, 0, 0, 0 )
shape = SubResource( 8 )

[node name="HitBoxTimer" type="Timer" parent="."]
wait_time = 0.5

[connection signal="body_entered" from="WeaponPivot/SamuraiSword/SamuraiSwordHitBox" to="WeaponPivot/SamuraiSword" method="_on_SamuraiSwordHitBox_body_entered"]
[connection signal="body_entered" from="PlayerHitBox" to="." method="_on_PlayerHitBox_body_entered"]
[connection signal="body_exited" from="PlayerHitBox" to="." method="_on_PlayerHitBox_body_exited"]
[connection signal="timeout" from="HitBoxTimer" to="." method="_on_HitBoxTimer_timeout"]
          GDSC            ?      ���������϶�   �����Ӷ�   ����϶��$   ����������������������������������Ҷ   ���϶���   ���Ӷ���   ����������ƶ   �������Ӷ���   �������¶���   �������Ӷ���   ���Ӷ���   �����޶�   2         enemies       Main                   	      
                        !   	   7   
   =      3YY8;�  YY;�  SYY0�  P�  V�  QV�  &�  T�  P�  QV�  �  �  PQT�  PQT�	  P�  QT�	  P�  T�
  Q�  �  T�  �  Y`           [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [remap]

path="res://Main.gdc"
 [remap]

path="res://Normie.gdc"
               [remap]

path="res://Player.gdc"
               [remap]

path="res://SamuraiSword.gdc"
         �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         Tresend    application/run/main_scene         res://Main.tscn    application/config/icon         res://icon.png     display/window/size/height            display/window/stretch/mode         viewport   display/window/stretch/aspect         keep   editor_plugins/enabled          +   gui/common/drop_mouse_on_gui_input_disabled            input/ui_accept�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index          pressure          pressed           script         input/move_right0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis       
   axis_value       �?   script         input/move_left0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis       
   axis_value       ��   script         input/move_foreward0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       ��   script         input/move_back0              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script            InputEventJoypadMotion        resource_local_to_scene           resource_name             device            axis      
   axis_value       �?   script      
   input/jumpH              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script            InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index          pressure          pressed           script         layer_names/3d_physics/layer_1         Environment    layer_names/3d_physics/layer_2         Player     layer_names/3d_physics/layer_3         Enemies    layer_names/3d_physics/layer_4         Weapon  )   physics/common/enable_pause_aware_picking         %   rendering/vram_compression/import_etc         &   rendering/vram_compression/import_etc2          )   rendering/environment/default_environment          res://default_env.tres        
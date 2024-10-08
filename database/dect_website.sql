PGDMP         $                |            dect_website    13.15    14.12 O    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    16394    dect_website    DATABASE     h   CREATE DATABASE dect_website WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';
    DROP DATABASE dect_website;
                postgres    false            �            1259    16395    audit_trail    TABLE     v  CREATE TABLE public.audit_trail (
    id bigint NOT NULL,
    action character varying(255),
    http_method character varying(255),
    ipaddress character varying(255),
    requested_on timestamp(6) without time zone,
    response_status character varying(255),
    url character varying(255),
    user_agent character varying(255),
    username character varying(255)
);
    DROP TABLE public.audit_trail;
       public         heap    postgres    false            �            1259    16401    audittrail_ger    SEQUENCE     x   CREATE SEQUENCE public.audittrail_ger
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.audittrail_ger;
       public          postgres    false            �            1259    16403    employee_seq    SEQUENCE     v   CREATE SEQUENCE public.employee_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.employee_seq;
       public          postgres    false            �            1259    16405    gallery_event    TABLE     �   CREATE TABLE public.gallery_event (
    id bigint NOT NULL,
    description character varying(255),
    event_date date,
    title character varying(255)
);
 !   DROP TABLE public.gallery_event;
       public         heap    postgres    false            �            1259    16411    gallery_event_id_seq    SEQUENCE     }   CREATE SEQUENCE public.gallery_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.gallery_event_id_seq;
       public          postgres    false    203            &           0    0    gallery_event_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.gallery_event_id_seq OWNED BY public.gallery_event.id;
          public          postgres    false    204            �            1259    16413    gallery_images    TABLE     �   CREATE TABLE public.gallery_images (
    id bigint NOT NULL,
    filename character varying(255),
    gallery_event_id bigint
);
 "   DROP TABLE public.gallery_images;
       public         heap    postgres    false            �            1259    16416    gallery_images_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.gallery_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.gallery_images_id_seq;
       public          postgres    false    205            '           0    0    gallery_images_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.gallery_images_id_seq OWNED BY public.gallery_images.id;
          public          postgres    false    206            �            1259    16418    key_contacts    TABLE     B  CREATE TABLE public.key_contacts (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    mobile_number character varying(255),
    name_and_designation character varying(255),
    office_number character varying(255),
    updated_at timestamp(6) without time zone,
    email character varying(255)
);
     DROP TABLE public.key_contacts;
       public         heap    postgres    false            �            1259    16424    key_contacts_id_seq    SEQUENCE     |   CREATE SEQUENCE public.key_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.key_contacts_id_seq;
       public          postgres    false    207            (           0    0    key_contacts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.key_contacts_id_seq OWNED BY public.key_contacts.id;
          public          postgres    false    208            �            1259    16426    news_notices    TABLE     7  CREATE TABLE public.news_notices (
    id integer NOT NULL,
    attachment_name character varying(255),
    description character varying(255),
    end_date date,
    is_live boolean,
    start_date date,
    title character varying(255),
    upload_date date,
    whats_new boolean,
    news_type_id bigint
);
     DROP TABLE public.news_notices;
       public         heap    postgres    false            �            1259    16432    news_notices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.news_notices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.news_notices_id_seq;
       public          postgres    false    209            )           0    0    news_notices_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.news_notices_id_seq OWNED BY public.news_notices.id;
          public          postgres    false    210            �            1259    16434 	   news_type    TABLE     [   CREATE TABLE public.news_type (
    id bigint NOT NULL,
    name character varying(255)
);
    DROP TABLE public.news_type;
       public         heap    postgres    false            �            1259    16437    news_type_id_seq    SEQUENCE     y   CREATE SEQUENCE public.news_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.news_type_id_seq;
       public          postgres    false    211            *           0    0    news_type_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.news_type_id_seq OWNED BY public.news_type.id;
          public          postgres    false    212            �            1259    16439    notification_type    TABLE     c   CREATE TABLE public.notification_type (
    id bigint NOT NULL,
    name character varying(255)
);
 %   DROP TABLE public.notification_type;
       public         heap    postgres    false            �            1259    16442    notification_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notification_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.notification_type_id_seq;
       public          postgres    false    213            +           0    0    notification_type_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.notification_type_id_seq OWNED BY public.notification_type.id;
          public          postgres    false    214            �            1259    16444    notitication_tenders    TABLE     F  CREATE TABLE public.notitication_tenders (
    id bigint NOT NULL,
    attachment_name character varying(255),
    description character varying(255),
    end_date date,
    is_live boolean,
    start_date date,
    title character varying(255),
    upload_date date,
    whats_new boolean,
    notification_type_id bigint
);
 (   DROP TABLE public.notitication_tenders;
       public         heap    postgres    false            �            1259    16450    notitication_tenders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notitication_tenders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.notitication_tenders_id_seq;
       public          postgres    false    215            ,           0    0    notitication_tenders_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.notitication_tenders_id_seq OWNED BY public.notitication_tenders.id;
          public          postgres    false    216            �            1259    16452    roles    TABLE     W   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    16455 	   roles_seq    SEQUENCE     s   CREATE SEQUENCE public.roles_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.roles_seq;
       public          postgres    false            �            1259    23631    users    TABLE       CREATE TABLE public.users (
    id bigint NOT NULL,
    createddate timestamp(6) without time zone,
    isactive boolean,
    name character varying(255),
    password character varying(255),
    updateddate timestamp(6) without time zone,
    username character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16463    users_roles    TABLE     ^   CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.users_roles;
       public         heap    postgres    false            �            1259    16466 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public          postgres    false            d           2604    16468    gallery_event id    DEFAULT     t   ALTER TABLE ONLY public.gallery_event ALTER COLUMN id SET DEFAULT nextval('public.gallery_event_id_seq'::regclass);
 ?   ALTER TABLE public.gallery_event ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            e           2604    16469    gallery_images id    DEFAULT     v   ALTER TABLE ONLY public.gallery_images ALTER COLUMN id SET DEFAULT nextval('public.gallery_images_id_seq'::regclass);
 @   ALTER TABLE public.gallery_images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            f           2604    16470    key_contacts id    DEFAULT     r   ALTER TABLE ONLY public.key_contacts ALTER COLUMN id SET DEFAULT nextval('public.key_contacts_id_seq'::regclass);
 >   ALTER TABLE public.key_contacts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207            g           2604    16471    news_notices id    DEFAULT     r   ALTER TABLE ONLY public.news_notices ALTER COLUMN id SET DEFAULT nextval('public.news_notices_id_seq'::regclass);
 >   ALTER TABLE public.news_notices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209            h           2604    16472    news_type id    DEFAULT     l   ALTER TABLE ONLY public.news_type ALTER COLUMN id SET DEFAULT nextval('public.news_type_id_seq'::regclass);
 ;   ALTER TABLE public.news_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            i           2604    16473    notification_type id    DEFAULT     |   ALTER TABLE ONLY public.notification_type ALTER COLUMN id SET DEFAULT nextval('public.notification_type_id_seq'::regclass);
 C   ALTER TABLE public.notification_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213            j           2604    16474    notitication_tenders id    DEFAULT     �   ALTER TABLE ONLY public.notitication_tenders ALTER COLUMN id SET DEFAULT nextval('public.notitication_tenders_id_seq'::regclass);
 F   ALTER TABLE public.notitication_tenders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            
          0    16395    audit_trail 
   TABLE DATA           �   COPY public.audit_trail (id, action, http_method, ipaddress, requested_on, response_status, url, user_agent, username) FROM stdin;
    public          postgres    false    200   q[                 0    16405    gallery_event 
   TABLE DATA           K   COPY public.gallery_event (id, description, event_date, title) FROM stdin;
    public          postgres    false    203   )�                 0    16413    gallery_images 
   TABLE DATA           H   COPY public.gallery_images (id, filename, gallery_event_id) FROM stdin;
    public          postgres    false    205   ��                 0    16418    key_contacts 
   TABLE DATA           }   COPY public.key_contacts (id, created_at, mobile_number, name_and_designation, office_number, updated_at, email) FROM stdin;
    public          postgres    false    207   D�                 0    16426    news_notices 
   TABLE DATA           �   COPY public.news_notices (id, attachment_name, description, end_date, is_live, start_date, title, upload_date, whats_new, news_type_id) FROM stdin;
    public          postgres    false    209   8�                 0    16434 	   news_type 
   TABLE DATA           -   COPY public.news_type (id, name) FROM stdin;
    public          postgres    false    211   ��                 0    16439    notification_type 
   TABLE DATA           5   COPY public.notification_type (id, name) FROM stdin;
    public          postgres    false    213   �                 0    16444    notitication_tenders 
   TABLE DATA           �   COPY public.notitication_tenders (id, attachment_name, description, end_date, is_live, start_date, title, upload_date, whats_new, notification_type_id) FROM stdin;
    public          postgres    false    215   �                 0    16452    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    217   <�                 0    23631    users 
   TABLE DATA           a   COPY public.users (id, createddate, isactive, name, password, updateddate, username) FROM stdin;
    public          postgres    false    221   a�                 0    16463    users_roles 
   TABLE DATA           7   COPY public.users_roles (user_id, role_id) FROM stdin;
    public          postgres    false    219   �       -           0    0    audittrail_ger    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.audittrail_ger', 5751, true);
          public          postgres    false    201            .           0    0    employee_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.employee_seq', 1, false);
          public          postgres    false    202            /           0    0    gallery_event_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.gallery_event_id_seq', 5, true);
          public          postgres    false    204            0           0    0    gallery_images_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.gallery_images_id_seq', 18, true);
          public          postgres    false    206            1           0    0    key_contacts_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.key_contacts_id_seq', 10, true);
          public          postgres    false    208            2           0    0    news_notices_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.news_notices_id_seq', 30, true);
          public          postgres    false    210            3           0    0    news_type_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.news_type_id_seq', 7, true);
          public          postgres    false    212            4           0    0    notification_type_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.notification_type_id_seq', 1, false);
          public          postgres    false    214            5           0    0    notitication_tenders_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.notitication_tenders_id_seq', 13, true);
          public          postgres    false    216            6           0    0 	   roles_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.roles_seq', 1, false);
          public          postgres    false    218            7           0    0 	   users_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.users_seq', 1, false);
          public          postgres    false    220            l           2606    16476    audit_trail audit_trail_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.audit_trail
    ADD CONSTRAINT audit_trail_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.audit_trail DROP CONSTRAINT audit_trail_pkey;
       public            postgres    false    200            n           2606    16478     gallery_event gallery_event_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.gallery_event
    ADD CONSTRAINT gallery_event_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.gallery_event DROP CONSTRAINT gallery_event_pkey;
       public            postgres    false    203            p           2606    16480 "   gallery_images gallery_images_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.gallery_images
    ADD CONSTRAINT gallery_images_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.gallery_images DROP CONSTRAINT gallery_images_pkey;
       public            postgres    false    205            r           2606    16482    key_contacts key_contacts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.key_contacts
    ADD CONSTRAINT key_contacts_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.key_contacts DROP CONSTRAINT key_contacts_pkey;
       public            postgres    false    207            t           2606    16484    news_notices news_notices_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.news_notices
    ADD CONSTRAINT news_notices_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.news_notices DROP CONSTRAINT news_notices_pkey;
       public            postgres    false    209            v           2606    16486    news_type news_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.news_type
    ADD CONSTRAINT news_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.news_type DROP CONSTRAINT news_type_pkey;
       public            postgres    false    211            x           2606    16488 (   notification_type notification_type_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.notification_type
    ADD CONSTRAINT notification_type_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.notification_type DROP CONSTRAINT notification_type_pkey;
       public            postgres    false    213            z           2606    16490 .   notitication_tenders notitication_tenders_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.notitication_tenders
    ADD CONSTRAINT notitication_tenders_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.notitication_tenders DROP CONSTRAINT notitication_tenders_pkey;
       public            postgres    false    215            |           2606    16492    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    217            �           2606    23640 !   users ukr43af9ap4edm43mmtq01oddj6 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT ukr43af9ap4edm43mmtq01oddj6;
       public            postgres    false    221            �           2606    23638    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            ~           2606    16498    users_roles users_roles_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);
 F   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT users_roles_pkey;
       public            postgres    false    219    219            �           2606    23641 '   users_roles fk2o0jvgh89lemvvo17cbqvdxaa    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa;
       public          postgres    false    221    219    2946            �           2606    16504 '   users_roles fkj6m8fwv7oqv74fcehir1a9ffy    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy;
       public          postgres    false    217    219    2940            �           2606    16509 (   news_notices fko9s3wm6k27h05sjne5uu76ae9    FK CONSTRAINT     �   ALTER TABLE ONLY public.news_notices
    ADD CONSTRAINT fko9s3wm6k27h05sjne5uu76ae9 FOREIGN KEY (news_type_id) REFERENCES public.news_type(id);
 R   ALTER TABLE ONLY public.news_notices DROP CONSTRAINT fko9s3wm6k27h05sjne5uu76ae9;
       public          postgres    false    2934    209    211            �           2606    16514 0   notitication_tenders fkr6qepac55x66kfgnyvglbu7gp    FK CONSTRAINT     �   ALTER TABLE ONLY public.notitication_tenders
    ADD CONSTRAINT fkr6qepac55x66kfgnyvglbu7gp FOREIGN KEY (notification_type_id) REFERENCES public.notification_type(id);
 Z   ALTER TABLE ONLY public.notitication_tenders DROP CONSTRAINT fkr6qepac55x66kfgnyvglbu7gp;
       public          postgres    false    2936    215    213            �           2606    16519 *   gallery_images fkrxr95chjccp0bwfiwc03yo7f0    FK CONSTRAINT     �   ALTER TABLE ONLY public.gallery_images
    ADD CONSTRAINT fkrxr95chjccp0bwfiwc03yo7f0 FOREIGN KEY (gallery_event_id) REFERENCES public.gallery_event(id);
 T   ALTER TABLE ONLY public.gallery_images DROP CONSTRAINT fkrxr95chjccp0bwfiwc03yo7f0;
       public          postgres    false    205    2926    203            
      x�՝Q�_9n�{>�`[�(��*O� �I6fyY`���cܮA��l�_R��|�ƹ� U����W�7ҥ�(�������߾y���w�����^���}G���ڿ�����6���`"�W���߾���ۗo^}��\����w�r��޽�꥔��o��݇7������E������{�����o����o����ӻO/���������������x��ݟ޾�Ƿ��t��/���?_���e#*5�y�W?������Û����^���݇�t�r���ɴ����_>� ������gL�Ԋqv��70+���
�^��T�]��CjWu�!&�}�����|���çW�?�����b�h�J�JF!�j9^����ˊ��Ll.�\j������ӫO�^�|����bG���G�e�p��޿/�����C�>Rn�g��fg��<W�p1w6}Ƌi9��T�h|1�ᚽ~���5m.7Uz-��
,�N͞�ZRz��|-�
ga�a��W\�d��g�2�a�>ؤ�W��5�=�-�4�w����q�*h�N�
.4-t�z_k$-��*��O�r����qX��+v�i��\���ݟ�*�O��F��b�bZ�8�c�sT<#�x���:��~&�y�C���b����<T����縊y�C�7cz�q6/�������+*S&�s�<��<N;E����Ii�ĥ��{�֤4��q6���<�kR���wHa;ܘḒǽs��q��͕<��J���s��U<l$O���cv¾)�����X߆-yX;�V���J�'����{���X\ҕv
�%���:X��d-/7�Ű*x��������jy�!~,aly��rC����������1�v�������� �8Oy��~]n�a���-�R'vܠ��P�~	Ml}Hy��e�n��2����s<R^m��~8x�ȫ�QT�sl���KC�]��V�4����Z�
�d�^����D� ���y�1����ˠz^k�2��Z���W?�E&v��i��\l$��J��]	��J�n�ZW_���p.����`{Zo8�7��|O��1dboCN���.���i��\V;w�m�i�����Jl���襉�a_�nԭ~�d
Εnԭ.�u��J����'&[�������ׯ�~�����/�_�xΖ��00�f*7+����b�����_~���1�,�fܚ�Dj�=��TR�*�������TR�K��bsIRJQUVj���\I)�����دD��R�K��h�|��K�fT��/��3�BD���}%ږ�r"ߝV�`�-��DR�zm��;�H��4�/���\r.ViΕ�Qr.�L�"m�n$��7N��nG�������3�w�X�F�~�BW���o�Ε!��Gi� �������6#�͕��ˏe�<Όܸpi��rf�ƅk�[�Ό��\#�:Џ噑.�t����ȍ�y�h.����,:.�y�+�7�4Se��S��.�*;��5�:�7�,4cŰ��zc����T���Z�L������v�UR�� />�T���aue�e��jվpY7�o�?a%9ո�)��ntTؔ�6n����pA����T���h� �;�ڸ7��!ͰM�9���\=�6?�'�	�ڸ���F��0l)���^X-*��%�+)E�Jj�?vJ�S]�Υ���ӡbK�T���O�}���7:���.�����h�>�S]ܛK�]ۄ�S�9Q��gB-R��\9�і7��=��S#�6���g�.W��H��%����~��ԡ�5���!��*��:��W��P��Ϝ,����3�C��
9V��W!6�.����%Ek5�?N�Z\���Ɋ��R�6W/�P�m�̩�@��Uo�9��aj����2zv#5�gsY�a�͕�+�6���rc�i��ݐɩ�>��5#l�N��\V��<k���Ck2�_���$�f�l.-"c`�	pj:��e����u���γ����*��*���\���08����Y��^��25q��e��`%5[gqI-��)x����5it�������,�ݍS�r�i�7Z�E��6���ͥe��۹q�yvqE?N�00�����_PʇR��zXuԃ%RRd��$�6X���X��]�X8����}Y��4> ]z�ûׯ>��� Ö�=�[]E#H^�y����x��,�/���G�p��
�Oo��u�T�����|U=�7�\�gq�7ֹ4<��tb�p�76�zDǭǕ�����+��^ɶXaߦ}С4	)�1�ʐz�?"%%ƈqE�s��&{a�ˏ,�����ȋ��[�&xHϨ���5\��V�,Z�vs��ҽa�SH�vq�[�L�΢I�]tq	��-�I��F�PT	q���$�-����U�b?K�vwq�^j�ڠ��$U�)�H9��]�!��ݾZ4F�� \͆ñ:�*U�>�5G�Cn����/��ñ1���37����Ul��esY1��]�����5��F�>�5�<����U|&o)�eMܴ]S�.�nj����%��	��QS�.nd[n���/<:vrCS���9��M5�o.-L<�;�4� �҉n�����cb��i�A~s���d��IM5�_�z��mԠ��W�kM5�_��8�ϡ��rù,&X`��Ԙ���J����Ԙ��%Zj��Ss�7��d_On��;׌7��*US��7��*;�����ܘ+�6�t�0��3� ��
��JM:_\TK�>RUS��7j
^��I��e�_+��545�|q�Ztr@c%����9��i45�|Sq���(��r���p�)�7aZkt+���X��\����v��Ԕ��Ee��^�Ԙ����g�R�Ɯo.qm8���45�|ci�j��r��F�.ە]SS�7���<v 5�|QI+�v��O�8�p�}�ņ�⭝�-45|sqaU9��A��KK��ƶ��� ��e�Ul'TM�\��L�S&��[�&�j:�=4Y�\T(����+�6���>l�U�)���#��b[j�ixsY��C�}��FpE<\��+�7��G����SN�kUNp�r�\�L�����)����\ư�=�@SNÛK=�a;�i�ixq��?�RSN�ᛴ�״1��a�ixs�<�ٱmC4�4���n�Q#)6�*��u�W��|�����<i��s�P��<x5J�gxq��5�<y��v��d��>Ú��\V���I������1k?N)4aӔ��bc�i5Rm�lI�1��ո��`�-�<V%Ѭ~>������,��3ؓI2cց�v|��dK�]�b���R&ě���ڎ��l9=B�,��xl9MB6��oK9;�*[1���F��%�\��:�!��睪){��rDy�!]��w�)���B$�~7��T�5�H�����k')xpʢxs�Kc���:d�����!_�V�-�S����c��T���7�(͔iH���l�H#9�������cp{<IO2�	������q�2RFtl$*}��*=RN{#�}�?��0�	)�-m��Q��x#�7���2��������ߓc~��B�H��.�U&�K#姷�؉���C#奷�����2}�,�3UX����#qܨ��!��My獰 n�?�&��!e���<:Y��M6R�y1ac�(D���Kj��~�*��K卫/�W���PoK#呷���xke܍��D���q�RN<�(���n��zh2Tq�x�o#���q�/DBʩGb*�vߥL�Fԣ�� �u��H�ߍ�u�-z� �(�b���p���EE�i�@��̯$��RN;R4�h��!<�6��<��C�9�Z�q�CN:Ҥ�]�H�Z���r��uM�۱G�T3��e�H'����j&^\~��S���5�TC��-S�r����ʝQ�L>-|�Pc����le�]	[EG�z:���Z�t����م�cE�����Y�	��68�"�Re���E���.UF�n�YƜ�*��>K���؜��Pi�`���Q�m�qtbDK=�-��<v�^��2�2G�h��t������֊�x��ܖzv��ń��#"ZNz��SB�<ZR�X    �rR�|x�GDK���f�ŏ�I5b���M�������F�&?B&��B�Dp��s�Bc+����a$�l�ѦGH��<uD���Z���ϵ�;�FsymJ��ZZ����>�o-�Fd�sM񿵴���:�oȴq������ԋ���Xr�s�߲S/�K�9�-;5��f:�c�G˩�@�"����SD��q�������sE��>K�z,GK�g�\m.�E�7|m�vu�6J���vW��ۿ����d�j�"��#7x�u��K�G�m��ǀm"��ث$����>f&^m�h"T�����zu��c�ѯh���)z�d�W!Yf����VQ�J-3�*�"���	)'5iĬ���)W��G���C�	)'*I��F��o'�W���d�����h�����)5�8�w ��d��Y��n�bf�U �2�͞�N���l��2��^�lIU1VgG�֟��%��؇�L|ok�Ԥ߰Yt��sX���WT��c?9"[R{D�NL���ؒ�c,�'���mm��W�Mj�9�ď%��W7l����"�ߺe�_ݰ�E��3�d&`ݰ�+�M2$ZR�X��h��ؒ��"�8}ݎ-�l9Y�5Z�v9��!��dI�i�;��ܰ�X��FR$-�ޓh�ݖ��`�9m=< ��	Ǣ�Ѵ. p`��X,����_��h� �E�����k�o��1wN�YM�XV1�w�^�8���>���)��VL*���<�w{K���0�i�q�4K#�C��iyqAjT4��Ps��|��-���CM�����D3*X�y�����n���������"�5�~��Ż���-���%z�������Ͷ�1�����lIY1�F`6kG�kD���XC��G�TD��Ґ5���N�2mH���
�����r�Cz�ZG�Ex��q6��z�ÿ�������}�'G�W���.D��1��4�2�y�����jB�<�^{a�H$�&���|�f��%��c=0\��|w��Q���ZHz����Z��lǅ(Qd5�����JV�u��u6z|ᢘ�ӏ��p����F�`kk��u2�����S��Z��ざ��ٹ�^d�`�����~@Ku��r�ԵL������^`n�l��s���^^n��t!j�<Q���4�-W�,j�	��:�F�H}YК�ސ۸�+�36���)vH3�)^���_���k�����F�8׽�K�����d#��C3w�c)�1IKBtB�#�4�#���� [X���p$������:RNU҈9u�+�ә�[�N��
j�#�/G�a�t���Y�/H��{ż@H9�H����F��S��E�ȱ�)�f��w��8���{�<�Mfk����ށ�L4n���p�ȩ�@��(����Er�ē�G�$+��0��gY���u�{�9ZN[8��Q4^���F��/܇MpK_��-o�,L��+�����6J�n˵���u-�$#��1�7,��ܩzQ��%������G�S:)<�D��U�-�~�!�WL��;`�8m�MJk�C�i��[0	���8N�~!�2��Vޟv�$��5*y��6�G;WZN�m|��p\I-5���fe�i�\S5i�Gl���XG��T�ݿ�pi��ঢ়��p�2�^�W��Z\�J�����i��/H�Z��1N;}}�_���yQe�v��¦��"�"��.__�fl�Y�LN�|ݠͨ�k}���e�)t����"�>���r�#��/*S*|����-�k�w��E�-U�/���A�ҿ�*��Ƈy�p�.nm'��|�x���(jF��\�.>r�[��\\DW������n�V��_0�i�]��r��k<����I��Rh�.e�h-�o�:ۓ<������E����$�t
�䄩;l��St(�xh�ԛ���~z��@X�GA��/�T�CfO��>��|���$�?���3�T��'�M�%C挒�I��ӠgC�jTa�c<ɥ-�v.�umF3+��<�Ժ��z�i�F��oH�5�B��3�W!٬��'���;ٟx/:$�Mt���I_�[��IBb=L"�\N���X�?�jX<�r�T��1��t9m�p�a�?
���?�~����>�����3k�c���K �$)�_}Z��~����Oן?Z�/�Yiu��U�C�l����Y��`��~���SxvL{Ԓ�RF!o$.R�)��S\y���%��i��Rhy�ц��&��o�ν�~6k}�w���'߻d�0���W���ν���IkB�Z�B��Xt&�j-"�=�$5%�7���K��L80��ֈg��ͣ�,�<�v��JTQ�R�-UNk���Z��.�H.U�3kt�]��"�1zT`���i�j��BJ��S�Iv��� �R���t�ū�@��K�H�ڜI�ߣ,�����n���c��Re��6����BAJ*
	3��������B"{�kmz?H }PIE��H��6���r��@��ǣ}I���bBb(InVL�����vԡ���eI1��b�
n�\��k�b�ǵ�K%e�FϬ��)���������H�SRKl,���jU�B�=����b��{�BJUVn&W�.b0IE�}I-��h�=��RRKX�5W���Zb��
Y���h�ͤ��XC�8�g�fRKتL�"�Q��RH�����x0=����������!�-]��`�\]��F�mj�(�Se��ŉ�j�o��ڍѴ�f�2�8�&pp�e1u*b֏��G�Igqq-��|@5!qe��ĈQ�"~3��Źjj�Ѣ���>��
����������͕z�Y\��z�����P�5b�8��u��RMx1�q�cv����7�?�c�P$�����t�����'��J=\�ū����%�z@[���?�x��4)?�T�̽��7h�Y����wG���I��0�����TR���%Ņ��J�.!���֣g�Je2���D��6(�DA��R�X��	W�iN99j�����ه4�hIuqn$�~\��R&s��F��/�H�k�b�TF����}P'�K�bɾM�x܉�)�LZs#�2��q�⋂�������t���+y�#y�)����\ɻH�)+��hY!�a���%���w����� -��ᒷH��	7�A��br!�}����;9a�.�t}4�4]NN��EZ�JU�W�R�lbb9Y����wD�ݗkHu���^R�s��Vc���^GQ�RE�1T2���V:���*6�(�瀭O��S���l.4�z<�IYVl6Y���.")ˊ�5<��{�6��l$�$�ql5�J�:IWfư��r�XH�K��*@4SIYTl�Y\0�@w���#	��:�a��Qw�z�B���R\9�\V:��Z�&%�F�Lh��EPb��*6��v|~Ë�I��ƨ�����()ˊ�����'�%���_�D�E�+����	&å�N��[�V<zT�g=_�~��[��Q/�z�d�ijf�/Wz���D-�{������"�H~ݷ۵���Qߎy���^��|��#Y ���&������".�e�Ղ���|��撘�ևҡZ,�(6���)�Ї6��ڑ��"�싣��o>�I�I��� ��/��\#���P��1=��xM�}9tbn����,�N��ԁZ<7����L��=�w��D���+^~:��qe�!�Ea��<
*jm�HԮ_��Z*h�Ñ��,���w�2�����IA�$r�x���R��`���,{Tq�W�
[Ib���.4l��rì��dk�x2P�'�I5�L��-xցܩh�d�-���+=�CZ�����?N&A�MX���b"D��/{H9�ߥLbX*�R�o@�Xu����::��<w�o���?T��љ��ԏ߉ܰ8S	���ң(KaM�f�2u3Q�j#��K%5�U���w���@�F)�T=j+����Bj.񲸨�J��JF��Xv�#%��3���FГ@�+s�ZX��*bF}�����E D�ډ�H��עJ��!gh�e�2��@[&
Rv����Y�ƹ���G�vT�8q� %����������!P`W8W"�r�e����� �  Q�2	�ʹ0~#C>~��f�[�Y�1�&`)Q��H�W��(Jja�����L#���o��Sr�D��V/��h��}��[6�E`��P_)�(�i�>��P���K(��Y\�>*�����V�O!X={������1���H;��r��]���\���w��p�Z?��v�w�pb���N��Uw��r��ɗ�o<�R�ǱjokR�fpkHf�F��wHk�;���j{9�1!�]�`[��~
ܻ�#�%O�!����1r�l��.�W�b�w���("[��٬��2�7IG:?���$a��n�4�w��X��mT�M��7u�0�/8���9J]�7V�>��@
R�t����M���(uw��=�}�)Ö��m��C�(H����!���g^Y7��"�q@EJƉ�"Qb|�����z�|�����Xْc��9�æ�{���"�i��`;٥gZ|6��[����{�z�I��1�sQ�2�wɊ�L!=c5H-��j���*�3&7D��ƕp)�&v�VL�F���H95H.�x�Ɛ� �DD ��$k�+*RN;Da��{��^w����HVĈQ})U�=�!_]�txoI�#h�N�s����x)P��H,��H�[$�{�#��%�����~N�DR??���zT��Xu-���\e����]�ߋ�k�i���%�s�� ����o嘪I��`�2�$�ǐ�־񒊴v��ƛ��y,-D\��Yh\�X:�EdK=�n��ro��z�ж�y��$�>�}�3�d���bӣ�DdKʓ��>�dHx��D�8��e�2Y��vA�>��B�%3�:2��A��JUT�(��#u��#�
)S��6�7ȹrV`���j��)�eR���v�U@H���F�~���ز�,��w������o?~�������'6�E�(
��=��7�����}X�����o?\������z�f~��K% �z2]i�	44���1<x
�����B�@=�w�)]"���ɹ3l�r���%����������w��ϧ�_�{�Bv�,�KF�Ҝ���E��"{��=ݹc�.�Y�Z�I��۹��]6����[~�B:����4�9�RRl���YѪ��c�3H' �"�h�ztoE��';�o��+��*��E)�s�;H���EpK�=�v���W #��v���t��Q#�%eG�d�_Wx<���XRq8X/����W`�4R'��ͨ�= �D�ɉ�_�M&=8�a�`M*�8���e�[r$H��i;ڲ����� ��Z֏�#��䥈��>��T
)�BV��6ث������'��Kq�EU�{�?8�%';�.\���ѓ$�\�O���H��=�0�WnW<E�����)���O�0	�f������3�u� �.���i��f# ��o�X��-j���pv��7�;L<��x,�[�d��+��Z{�@)�/�j]�I�cH�=��x}��="�v=�U~����o��|_�=���R��ƌ�r�m�KE�J��!�l�d[�q����\�-��T�{�ԓ�w�����qg\��r5^�P��OϜ�Z}˶����bg�4Y��Q�[�E!"4�ܷٙ`A����]/�;���h�{m���$G��i�q"���c���_���I���)#)9����6��O	��:;����"w�Gt�����]~������!         Q   x�3��H����Q(��,V �D�����ԲԼN##]#]##NW���!�i��LH�`�e�Y�RD�r!@\1z\\\ �U1�         �   x���=�0�>EGZ�?��p�:���h���
$�b�<�Oz����R.-���5�<�Υ]q��H��ш$^���c�@u��l o1�Yɿ }]e�A��g�sؑ���(ֿ��c�j�V�� �n�����wB��P:�BM�]��"��a~�����J��^         �   x����J�0���S��!�4i��.���Up=z	ݶi�%d�ު�� �e���3965W�h@`��N*f�$�h�u��"�Plܝ]��\�aw����/)C�6\�tC,��	vٍ�uY�);}�"JeqwZ��0L��{�#���m�-Sh�m����!zݻr�`�������b�U��MYf�����k��xd���7W�$?���LV{^>^��]�L����)�gF)}G�l�         a  x��V]O�8}N�5��DYۉ�,�0��XM�E+���iܦqd:��~�I��ا�J�s�=�~p�C�&���u��D�G��J3缺�g�Jr�j^N_��D����(��T��B<��ɺ���g��d���1#��-���h	T��`��%-��(�飤�/� �`u�W5_�0��c��n�dT��TRTL�?OA"
�߉Ǻ�64�S ���� ����+�EfZK&$��
N˄�[^U�7<c`T*X�gM#���A^�]
-�4.�ʚ�'Ζ�"m���O7Ǔ��>�_�]����z93�0���G�3o6��J{�ȷI��Ϩ�B��Mf"� b���'�#qUЄ5�J%bX�nnl�j���l>�}�SI&��� t��4��Ge�)ϵ��J,*V�&+�!&�DQؒJ��K�|��0Uo������:C�rx6���iNg�t�`�:W����}��y��X\�YjYTj���,E����[�/��M�JV	Y�8"1����
]�������_K�i��D�`���x���:�ud��5R/t�O�:B-����1MӖ
����nK�&K��e�"d� c�4D����{]`��(�d;�j���%�m�xr=����y��o<�i����C=.x��ֲ�����7Y�����%!��:Z)BQK4ё2V���یkQ>��3���z�9�4�yj����0 �����ۃ���������֝�u������1َa�M{�������wt8/����b�a�������m��J�zb�)A���b����͇��f��:�Ӯ*�ٷsf7����������Kb!wPi6͛��s����]گ�L*�8M9A��f4X-�� ���*�{nG���ۑ�i1�R�[�5�x3�<�zR��c�<�9��'���]�q�0]	!S^�ZȽz���>�������h2z/t�G�����dL6}��*׽��Pf!Ҝ���8ꂅ(�\�C��`j����#rV��d�m$^C.A�����C���˪*xbl7

F�|6�M꺾g:�=��:�諨��Ck�n�e����_��d0�6I�F         (   x�3�tN,JM-�2�t-K�+)�2��/�H-*����� ���         .   x�3���/�L�LN,����2�I�KI-�2��/�H-*����� �z6            x������ � �            x�3�LL�������� $�         �   x�3�4202�50�52W0��20�21�,�tL����T1JT14R�7-���3�O)�Ȍ��w�4�0�+HOɫ��JKq*�+Ms2	0v��1��w+�
���4�Ԙ3d,�T�(�`hne�6Z\Z�ZD5��L7��,��>F��� �D�            x������ � �     
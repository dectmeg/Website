PGDMP         ;                |            dect_website    13.10    13.10 O    "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            %           1262    178293    dect_website    DATABASE     h   CREATE DATABASE dect_website WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_India.1252';
    DROP DATABASE dect_website;
                postgres    false            �            1259    211244    audit_trail    TABLE     v  CREATE TABLE public.audit_trail (
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
       public         heap    postgres    false            �            1259    203047    audittrail_ger    SEQUENCE     x   CREATE SEQUENCE public.audittrail_ger
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.audittrail_ger;
       public          postgres    false            �            1259    186588    employee_seq    SEQUENCE     v   CREATE SEQUENCE public.employee_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.employee_seq;
       public          postgres    false            �            1259    203014    gallery_event    TABLE     �   CREATE TABLE public.gallery_event (
    id bigint NOT NULL,
    description character varying(255),
    event_date date,
    title character varying(255)
);
 !   DROP TABLE public.gallery_event;
       public         heap    postgres    false            �            1259    203012    gallery_event_id_seq    SEQUENCE     }   CREATE SEQUENCE public.gallery_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.gallery_event_id_seq;
       public          postgres    false    215            &           0    0    gallery_event_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.gallery_event_id_seq OWNED BY public.gallery_event.id;
          public          postgres    false    214            �            1259    203025    gallery_images    TABLE     �   CREATE TABLE public.gallery_images (
    id bigint NOT NULL,
    filename character varying(255),
    gallery_event_id bigint
);
 "   DROP TABLE public.gallery_images;
       public         heap    postgres    false            �            1259    203023    gallery_images_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.gallery_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.gallery_images_id_seq;
       public          postgres    false    217            '           0    0    gallery_images_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.gallery_images_id_seq OWNED BY public.gallery_images.id;
          public          postgres    false    216            �            1259    203135    key_contacts    TABLE     B  CREATE TABLE public.key_contacts (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    mobile_number character varying(255),
    name_and_designation character varying(255),
    office_number character varying(255),
    updated_at timestamp(6) without time zone,
    email character varying(255)
);
     DROP TABLE public.key_contacts;
       public         heap    postgres    false            �            1259    203133    key_contacts_id_seq    SEQUENCE     |   CREATE SEQUENCE public.key_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.key_contacts_id_seq;
       public          postgres    false    220            (           0    0    key_contacts_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.key_contacts_id_seq OWNED BY public.key_contacts.id;
          public          postgres    false    219            �            1259    194793    news_notices    TABLE     7  CREATE TABLE public.news_notices (
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
       public         heap    postgres    false            �            1259    194791    news_notices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.news_notices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.news_notices_id_seq;
       public          postgres    false    209            )           0    0    news_notices_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.news_notices_id_seq OWNED BY public.news_notices.id;
          public          postgres    false    208            �            1259    186498 	   news_type    TABLE     [   CREATE TABLE public.news_type (
    id bigint NOT NULL,
    name character varying(255)
);
    DROP TABLE public.news_type;
       public         heap    postgres    false            �            1259    186496    news_type_id_seq    SEQUENCE     y   CREATE SEQUENCE public.news_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.news_type_id_seq;
       public          postgres    false    206            *           0    0    news_type_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.news_type_id_seq OWNED BY public.news_type.id;
          public          postgres    false    205            �            1259    194809    notification_type    TABLE     c   CREATE TABLE public.notification_type (
    id bigint NOT NULL,
    name character varying(255)
);
 %   DROP TABLE public.notification_type;
       public         heap    postgres    false            �            1259    194807    notification_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notification_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.notification_type_id_seq;
       public          postgres    false    211            +           0    0    notification_type_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.notification_type_id_seq OWNED BY public.notification_type.id;
          public          postgres    false    210            �            1259    194833    notitication_tenders    TABLE     F  CREATE TABLE public.notitication_tenders (
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
       public         heap    postgres    false            �            1259    194831    notitication_tenders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notitication_tenders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.notitication_tenders_id_seq;
       public          postgres    false    213            ,           0    0    notitication_tenders_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.notitication_tenders_id_seq OWNED BY public.notitication_tenders.id;
          public          postgres    false    212            �            1259    178325    roles    TABLE     W   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255)
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    178330 	   roles_seq    SEQUENCE     s   CREATE SEQUENCE public.roles_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.roles_seq;
       public          postgres    false            �            1259    178359    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    created_date timestamp(6) without time zone,
    is_active boolean,
    name character varying(255),
    password character varying(255),
    updated_date timestamp(6) without time zone,
    username character varying(255),
    createddate timestamp(6) without time zone,
    isactive boolean,
    updateddate timestamp(6) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    178374    users_roles    TABLE     ^   CREATE TABLE public.users_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.users_roles;
       public         heap    postgres    false            �            1259    178323 	   users_seq    SEQUENCE     s   CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.users_seq;
       public          postgres    false            h           2604    203017    gallery_event id    DEFAULT     t   ALTER TABLE ONLY public.gallery_event ALTER COLUMN id SET DEFAULT nextval('public.gallery_event_id_seq'::regclass);
 ?   ALTER TABLE public.gallery_event ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            i           2604    203028    gallery_images id    DEFAULT     v   ALTER TABLE ONLY public.gallery_images ALTER COLUMN id SET DEFAULT nextval('public.gallery_images_id_seq'::regclass);
 @   ALTER TABLE public.gallery_images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            j           2604    203138    key_contacts id    DEFAULT     r   ALTER TABLE ONLY public.key_contacts ALTER COLUMN id SET DEFAULT nextval('public.key_contacts_id_seq'::regclass);
 >   ALTER TABLE public.key_contacts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            e           2604    194796    news_notices id    DEFAULT     r   ALTER TABLE ONLY public.news_notices ALTER COLUMN id SET DEFAULT nextval('public.news_notices_id_seq'::regclass);
 >   ALTER TABLE public.news_notices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            d           2604    186501    news_type id    DEFAULT     l   ALTER TABLE ONLY public.news_type ALTER COLUMN id SET DEFAULT nextval('public.news_type_id_seq'::regclass);
 ;   ALTER TABLE public.news_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    206    206            f           2604    194812    notification_type id    DEFAULT     |   ALTER TABLE ONLY public.notification_type ALTER COLUMN id SET DEFAULT nextval('public.notification_type_id_seq'::regclass);
 C   ALTER TABLE public.notification_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            g           2604    194836    notitication_tenders id    DEFAULT     �   ALTER TABLE ONLY public.notitication_tenders ALTER COLUMN id SET DEFAULT nextval('public.notitication_tenders_id_seq'::regclass);
 F   ALTER TABLE public.notitication_tenders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213                      0    211244    audit_trail 
   TABLE DATA           �   COPY public.audit_trail (id, action, http_method, ipaddress, requested_on, response_status, url, user_agent, username) FROM stdin;
    public          postgres    false    221   �\                 0    203014    gallery_event 
   TABLE DATA           K   COPY public.gallery_event (id, description, event_date, title) FROM stdin;
    public          postgres    false    215   (�                 0    203025    gallery_images 
   TABLE DATA           H   COPY public.gallery_images (id, filename, gallery_event_id) FROM stdin;
    public          postgres    false    217   ��                 0    203135    key_contacts 
   TABLE DATA           }   COPY public.key_contacts (id, created_at, mobile_number, name_and_designation, office_number, updated_at, email) FROM stdin;
    public          postgres    false    220   C�                 0    194793    news_notices 
   TABLE DATA           �   COPY public.news_notices (id, attachment_name, description, end_date, is_live, start_date, title, upload_date, whats_new, news_type_id) FROM stdin;
    public          postgres    false    209   7�                 0    186498 	   news_type 
   TABLE DATA           -   COPY public.news_type (id, name) FROM stdin;
    public          postgres    false    206   q�                 0    194809    notification_type 
   TABLE DATA           5   COPY public.notification_type (id, name) FROM stdin;
    public          postgres    false    211   ��                 0    194833    notitication_tenders 
   TABLE DATA           �   COPY public.notitication_tenders (id, attachment_name, description, end_date, is_live, start_date, title, upload_date, whats_new, notification_type_id) FROM stdin;
    public          postgres    false    213   �                 0    178325    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    201   ��                 0    178359    users 
   TABLE DATA           �   COPY public.users (id, created_date, is_active, name, password, updated_date, username, createddate, isactive, updateddate) FROM stdin;
    public          postgres    false    203   Ȉ                 0    178374    users_roles 
   TABLE DATA           7   COPY public.users_roles (user_id, role_id) FROM stdin;
    public          postgres    false    204   n�       -           0    0    audittrail_ger    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.audittrail_ger', 5401, true);
          public          postgres    false    218            .           0    0    employee_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.employee_seq', 1, false);
          public          postgres    false    207            /           0    0    gallery_event_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.gallery_event_id_seq', 5, true);
          public          postgres    false    214            0           0    0    gallery_images_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.gallery_images_id_seq', 18, true);
          public          postgres    false    216            1           0    0    key_contacts_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.key_contacts_id_seq', 10, true);
          public          postgres    false    219            2           0    0    news_notices_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.news_notices_id_seq', 27, true);
          public          postgres    false    208            3           0    0    news_type_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.news_type_id_seq', 7, true);
          public          postgres    false    205            4           0    0    notification_type_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.notification_type_id_seq', 1, false);
          public          postgres    false    210            5           0    0    notitication_tenders_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.notitication_tenders_id_seq', 12, true);
          public          postgres    false    212            6           0    0 	   roles_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.roles_seq', 1, false);
          public          postgres    false    202            7           0    0 	   users_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('public.users_seq', 1, false);
          public          postgres    false    200            �           2606    211251    audit_trail audit_trail_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.audit_trail
    ADD CONSTRAINT audit_trail_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.audit_trail DROP CONSTRAINT audit_trail_pkey;
       public            postgres    false    221            |           2606    203022     gallery_event gallery_event_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.gallery_event
    ADD CONSTRAINT gallery_event_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.gallery_event DROP CONSTRAINT gallery_event_pkey;
       public            postgres    false    215            ~           2606    203030 "   gallery_images gallery_images_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.gallery_images
    ADD CONSTRAINT gallery_images_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.gallery_images DROP CONSTRAINT gallery_images_pkey;
       public            postgres    false    217            �           2606    203143    key_contacts key_contacts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.key_contacts
    ADD CONSTRAINT key_contacts_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.key_contacts DROP CONSTRAINT key_contacts_pkey;
       public            postgres    false    220            v           2606    194801    news_notices news_notices_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.news_notices
    ADD CONSTRAINT news_notices_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.news_notices DROP CONSTRAINT news_notices_pkey;
       public            postgres    false    209            t           2606    186503    news_type news_type_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.news_type
    ADD CONSTRAINT news_type_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.news_type DROP CONSTRAINT news_type_pkey;
       public            postgres    false    206            x           2606    194814 (   notification_type notification_type_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.notification_type
    ADD CONSTRAINT notification_type_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.notification_type DROP CONSTRAINT notification_type_pkey;
       public            postgres    false    211            z           2606    194841 .   notitication_tenders notitication_tenders_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.notitication_tenders
    ADD CONSTRAINT notitication_tenders_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.notitication_tenders DROP CONSTRAINT notitication_tenders_pkey;
       public            postgres    false    213            l           2606    178329    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    201            n           2606    178368 !   users ukr43af9ap4edm43mmtq01oddj6 
   CONSTRAINT     `   ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);
 K   ALTER TABLE ONLY public.users DROP CONSTRAINT ukr43af9ap4edm43mmtq01oddj6;
       public            postgres    false    203            p           2606    178366    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            r           2606    178378    users_roles users_roles_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);
 F   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT users_roles_pkey;
       public            postgres    false    204    204            �           2606    178384 '   users_roles fk2o0jvgh89lemvvo17cbqvdxaa    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES public.users(id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa;
       public          postgres    false    204    203    2928            �           2606    178379 '   users_roles fkj6m8fwv7oqv74fcehir1a9ffy    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy FOREIGN KEY (role_id) REFERENCES public.roles(id);
 Q   ALTER TABLE ONLY public.users_roles DROP CONSTRAINT fkj6m8fwv7oqv74fcehir1a9ffy;
       public          postgres    false    201    204    2924            �           2606    194802 (   news_notices fko9s3wm6k27h05sjne5uu76ae9    FK CONSTRAINT     �   ALTER TABLE ONLY public.news_notices
    ADD CONSTRAINT fko9s3wm6k27h05sjne5uu76ae9 FOREIGN KEY (news_type_id) REFERENCES public.news_type(id);
 R   ALTER TABLE ONLY public.news_notices DROP CONSTRAINT fko9s3wm6k27h05sjne5uu76ae9;
       public          postgres    false    2932    209    206            �           2606    194842 0   notitication_tenders fkr6qepac55x66kfgnyvglbu7gp    FK CONSTRAINT     �   ALTER TABLE ONLY public.notitication_tenders
    ADD CONSTRAINT fkr6qepac55x66kfgnyvglbu7gp FOREIGN KEY (notification_type_id) REFERENCES public.notification_type(id);
 Z   ALTER TABLE ONLY public.notitication_tenders DROP CONSTRAINT fkr6qepac55x66kfgnyvglbu7gp;
       public          postgres    false    2936    213    211            �           2606    203031 *   gallery_images fkrxr95chjccp0bwfiwc03yo7f0    FK CONSTRAINT     �   ALTER TABLE ONLY public.gallery_images
    ADD CONSTRAINT fkrxr95chjccp0bwfiwc03yo7f0 FOREIGN KEY (gallery_event_id) REFERENCES public.gallery_event(id);
 T   ALTER TABLE ONLY public.gallery_images DROP CONSTRAINT fkrxr95chjccp0bwfiwc03yo7f0;
       public          postgres    false    2940    215    217                  x�՝M�^�q�׭_��LggF�W�W��� ��$�oh6%j������OD�z��[��@�Rk�6��(�F���81I�7��᷿}���w������7���?������m�W��ƺcn,�D��7�}|��?�������^���o����}������_�Ϳ�{���?}|���j����U���߽�?�����_?��������~�N�������ׯ����ǫ�����x���������?���w�����կ^����������O��������_L�r��5�u~����>� �#���_�wL4��0�����aVJK+�T�-���RVCwݚ�K�!��퟿}��������6��{5ƝНX#��9^����˛��,l.�+�������㏯|��7?~��ܑz�1~m���~h���ſC��R�W�2�d�żWq1Ov}���5��T������Zs����^�������:�
,�I�_�ZRz�X|-�
gcMs��YĢ�ٴL|ڸ/�(��]�~Cb�b�<-��E,s�K\Ţ
ڴ���-�����I����e���<�x��V�=��g�<V�=�e���W�,x2�f#����e�\�l�KT<VV<#~D7:e�_m]�P��*�ꒇy�W�.y���L/2�օ5X�޲u�Cm�"}����'h��T��(⏸�e���l/J��g�8+��óE���q��Ӎ��x�W�����\��~s�)1�>,��5w�Q<�7�ښ�}S��#|s-��G�.n��9��U�Ol��_c2�>E���d*v
t����n��y�Q�bX<�7�rC��}~��ܐ8�M[��ܐ"j*�<u�!��r��r������2�T���vܠ���&*}a�������ևT�ږM?���7,�e�hHu�a��pp�QW�T�slT�<�!�.�ko}�vlEu��|1c�׬k��2u �yͺ�XMך�eP��5V[s�֘e��=�d��7fYk;��_e�\k*�_e���ј���U��%<'��,��r����e���#L�6��,���/)\���}��ކ\�<[y���ˍن�8����F��J#Wp�r�n9?h��W�7~?q���v�o�?����ۏ���~���k�c���W�_��~]�_���������\�r���i���sQIѮ��5������6�Jg�撢��,��4⏱��Rjsq�K�_��(�6�23����.��Réc_^�g����)��2J����D�;�/��o{�����t��"/w.��imd�N/w.��*�(�.��}��r7Rp��'x�/�#���r�4�*����O�"B�ߛ�Y�\rp�,�5pO�U��5V����*r���c�����U�7.���K-WEnܸ�.�زwU���eYց~,��ܸqɢ��WEnܸ<@sq�荃˳�2�����z��pU�>��ԩ}㊯rb^s�S��Z�V�6W]o�<��� \���\ԛ�+vR�K����K�G7��s.uj\�VW�]FʥV��OW�Y�'��/���8���6e��;()k>BO�3���}pq6H��Km��4��ئ�\j���g[�ۅ�Km���Y���[����7�Ȋ�t���*J��������Rwpi��fq:tl�_���\s5�E���C����F�����}p��ec`��p�����tW�6!�RyN�����Ȕ?4WMm���q��n���H��KB�3c�+ri$���\ݰ_Ƹ4u���k��
��em靌f*��K�������¥�B�5��Ո���4:�����;���fm�AMl�b���x��k�t�öq��|��+T��e��4	����2zv�4����Ʀi��U�;�fc��â��u�&ұ2�4�gs�O������A>��i���6��=�'c��Kx`{@rif���M��O�K�y(�.���c��si:���--V�=V�4���e<���jz#�V�qz-����ĝ��p����l��%���P�Q��"����1:�E�qYv�����No�L�`�mJͳ�6s�s�R����~��i`����?���:d7ʹ��'K&$���ؗIR*�HE}��}��p	�(-�nKi|B���߼{���w�ð�����T���������Ï`���bމD�H����~���߾ɒ�7? %����#$�Y\�.M7u]�F1\�M�ٌ�Ḋcؐs'�ӫ�K��m:�N��HHE�H�L����DT���H�/-��&WYq�q��W�3$_��xH������=]��v�,Z���-������R��J�Y��E�R���n�-�)��f�PV	q�����-z`�m�O�~<�R��暳��}@	I�v7S��r2%�.ΐR���-��> W���vT���ǲVá�>�:
���j<�=��M�>��P����Z+MT��*7��˛;-�bP-u�\�IlD�cYK��kP����۰xK�4/���Zj��qy'pS-5�\�k����� ��An�r�� ��(~a���-��߰��4�-5�\ژxawvi�A�ƥ�bYK�7�e��Kմ� pY}1v礖�o\st�6j�R�����;vǵ��o\����\e�\�,��ai����ʸ���Ҙ��%��4��9���d_On����7���m���A�W�*'������X;�f]&x�/ʍ�Y 볃g�J��7�6e��T�Ҥ���Ҥ�+dT\+��5�4�|s��tr@c��J��e��4Zs~PqZ��(Z�r~`i�S�o²֘�D�?౰�5���3�v��Ҕ󃋚�	a�Wi�������R�Ɯ\�pa��ii����M��W�ki���eM�LlWv-M9?�<�� ��JFK�k�|i���K��]X��O¶h�� ������9-?���ll+-?���΂턪�A��j,����j�ѳɡ��G��������z��Fr�܇�J��4|p�i�ؖ�Zr>����!��jz#�2�@
�U��5�?Y���%��kW.pUr>�V[��qMKNÛ����a6В����ٱ����4��DڀU�%���M��k�-�xXr>�BҚض!Zr>���Q�(6�.�Z}�W��|�7W���<iS�Ns�T#�<x5J�gxs��eJ�<,��eu91�ϰ�|�.o�qx��3��"n�>�S� Mش�5��8~Z�T>[QuX��::�A��Ǯ$Z=���V�kߞ�y{��AV�:�LH��9*U|�i�"[Ʉ�`�����,"[M�o��n/���IH��vus�ư�#qp����o�7�-�����N	|<�T-�o��#ʋO�4�[-��"���<��"�YE�����^�H���K��4v9��C����؋�%m���J>��Fx�����W��fm��)-�V�!�j2H��㯪%��ܞOҋ�e�"U��F��o;�_FB����ڴi���Vrڳ4����D��xb$�ʷt �݈
�Ƴ����=�X��ꄋT��6Rܓs~���B�HwK�Ԑ�*�Q�%+��DD�u�����$oD�=$��D�D�ڜL�d�H�7��uH�=hK�y����S�J�y)��w��dVr��	�E![�p7^Q;x*<��Va^�(��r�p\-���ޖ�䑷�d�xke܍W�D�}�y�RM<$����q7^M=I1U� ^��;�Bⱝ���j�!�����w%<�z����P��Y���������g  ��v�鳡É����i6����~J5�H� �s��v8�\ֹ���&�(���B�jҁ8�Y:w�"=i)d���#��d�۱GY����Zm�H'��+5o��]̥�����Pl����<�!��jg�l�OO�-�Xᥧ3ߙ�G��Qő����޲�w�,��~v�X�a+��~�fҭt�Z�^�J�8�f�嬸KU��j�ֹ�
���K�i96'-"T�����*��@[���N��h�絍6FĎ>;>Z%Qh��<]�N���jz#�FO�^���g�ZN:9� �դG��=%����%�g+    '�ΧWzD��
�h>�)~�,�O'��"d����t�2�#dQ�l4^�@G+=�m4����FJ�vڊI~����VV#��X��\+��h!��M	�[+��Fk��Ո�>��[+���i��,��@[!��.��y>�� ����]z�;иuZ��o٥�V74W����FM��n����h55h����-�2�(��s���\8���̹:��7�9�qe��=��n����X�������d��?D҅���G���k#��KW�#�6Ǒ7�m"��ث{$��d�>V&^H�D����2��m�Գ_�r��=R�@��W!ye��=�6��Q�J�2�*�2�7%���T��d9+�acze��A43���)���T�$����ʌ�D�i����l��ZEQ1�2��zB�L��GZ-�h��*V�Z%��)����`��M�W\ֹ����*lwvt��[Q_�q�����JM�=�gG���u+J����\���lE�}:9��`+��NOB���+S�6�M���K*����F��"�ߺW�_ݳ�E���T&`ݳy(�M2$ZQ�x�����؊��3��b��-�l5Y�=[�N9��!��dI�i�;�����X����I:Z|�'����2+��{Ks�~z@��	�Ek6��. p`��XXVW���b��X	6w�`��y׺�x�r�ֹ�"b]ﾽqqVU�>Ю덷)���\:��ĺ�w�@�����x@Zm���
	鲼�!j��`�9�u���IBŋ����������zn]﬽!�������zG�D���<{���B���������o��zO����1iZ�Nx���XY#�����5"[Q`졆#>ӳm*"[Mi�]>mҩL��&9�R���s� ������w˿�V!���̖a���u���Ɩ�k.���������opLq�N���]� �p��?!u]o���I&m~���_{�I����.�v��6�(��zo$s��D���Vc�o���R�(����I҃Jv�O��u5z|⢜�3ϖ�p�#خF�d{�M�ur��o��S��F#c{���|���OX�崽s��R]��< MmK������=�o{�v
p�����k�I�N���_N�>p�̢!�`?��i�inZ�9rwpUt��ac��Ҍ`������'0o����"�j:#�h��zR	�y]��H���̓��B�i�D��Mh�NH�������d�T��D�?tb�w�@���D���P��r��	}@����v�RMP�v�4��e�_�z~BZ�X��!�TD e��s9,RM=$�6Y"��K ��zXic?���0r���e��6YM|���/{d�y���׀�EMM$��,GA5��N�*R$^,�H�=?!y[�̡+�3�U�f6gwC�d����8��h��5�)��_x�/pK_�-��<\��+�_���f��N7��>k�#Ц�t���X���v�4�(#؊�c���`��)]{�瘪�}��q����+'_��0t\6��&m�����M���[���]?�i[3�+�/;�%�����sM_ȣ���,�ě>K`8���Z�GD�3�p�؂�[p�:��-�e��O\�$<�+�e�O\�?����|Z�KF�k���n]6���4��N����'�����'U�e��Ol��)/2�����k�f\�����=���O����Z�Bw�_�A*��S��&<M㢲��g�/[|=�ŷ��]:J����F#1ZЕ��T�/�>̋�tq븨����{Z֢�;�����3׵�z��MtW1��Q@�����.���~�a�%�ڪ͞O~k�n�*�G%�k����ַN���<�Ю���e���}�c��vq��#��[�):�u<7h���?����w�Z<
�1��]=d�bȜ���7�_E��Њ!s�����UzaKhŐ���j��~�j�܍*,��\�Jh�RZ��Vv0��o�kI�Gh���N�0r-���cC:�Q�%�U;�y��>z�jS"+|��e���.�����fY�$$���$���dI�y�UP��k+'qKu�9����M��7f�� �����Oo޼���7?�������3Yo��[����_��?���>��1��������\58�ʆ�@�����ț}q1�g��/Z�SB�(���t�V�%��<>��%�����*��@�CN_ޚ]{��l��u�E+d�|����J_�
��u�����HZ����%$���`��12"�3L@"QK"��Zq}�r�	�U��L�q��u��ڂ��3y�*��\*���i�c$���"qԥ��R�<�l��5�1������F8%�R�m3��d�Ϲ-��)MX��$�����X)�L��ee /U%����s��]�����w I��[)�����7��Ī	��($�g���O��UT���.%�Z�"�b����/	RQLH%��c��	��	�kG7�g���>(/����Vpc��rS��ɾ�]��(#4{f}X>X�bv"�2�g�O=�����8�ȇ~Q��R�d�������TYy0����I*��+j��EK���,!���Xs%#��W���VȻ>��@�o�āe��Yt8K��Z�we�Y_�X��T|��p���&�������;�2B��-�V^����9��g���,��R��yb����A(�Ɗh:�V�br[8�֎��&5q���`�������7�c=����*�IrĨH�8����Z5��h���\�t�R}VE}�+�S�Q��*��l.J�e=O��*I���܆9��w �R^l܇�aW-q����9�� E��*n�l�P��H�����J\��+�yUv��X�t��m��g�L����R�y����tV�i��(��5i敱�@?�J�r`I��e���J���D�H��3m�*����i"Mְg�5Q���T!ֳ{"�r�S.��|��9�pM��Z-�.�I�À���u	���=�����X�ҵc3Mj6���q@����Xrܦľ���R%�y Y[C�=��� ���d(�"��N��s%!E$�W�_�+�i5'e����#$�#|�3��8\�����d���8\�I��s�#����L!$x��L� �}'L>�Z���aK�����]��UgG-�&&��Ř��yGD�}E1��T�8xa륔<��i7�)�z�u�T��C%S���ݡc_ɮ����yl}���*t7fs#[O����dYq��ndfhw)YV\�=ݳ`�a���@�K"��VíTM���q��[J!%�����$�u�D3��E��Z&5t'Y�8��Z\��6`\E�i�)�_aW��&1���$WX�Ѣ��̖	�u�J��S��&������aQc�1����]�dYqCs^���p.��.Yc1�.~�a6��d���P��5ZD��̣׫��b�B1�ER���< �F���J���ߐhdp��z�\�)��n�]�z�Z}��1oQW�+�^/	$O������p4�@~�Z��E����Z���^/9�$'�MS:U��U�?m�p��Mz�v�&���}q�q���`�dR"l7@�K�.�i1n��?��~6�	T6�C'���d#Mj��j�=-Z�o�8}Cg�/��B���+_~&���qU�!�Ei�7"
*jm�j�oLc/�ɡ��"�*{��m�T�2��"�"��$&׋�oL,�Y���8�ϫG�|%����$~���F��HB!!7�z)O�9�fP��'��=y/��`�#n��r����e�F���<@i���;ܐF�8Y�6��CJv����F��!Lq�r�a��Ku���⬋֩���a �⹛Hq�5�g�PQ��W�`���8~r��*%(V���̢,�51[��ԃ�2��i^*饯je�_��w-	��Rͬ���f�
�����|)=3���-F�Qb�̻@*n�`�����'�W�Z��$�UČ�V/� �� hD�ډH��7�J��!gheT�6��L[&
Ru���<Y�&���bf��:�g�8P�
�4rf|�����(��+������6T�3��(H �  ����0q#C>~��f���x0�&`�P�H�w��(Kja�^��<�,��4n��S
�B��=�l6B4����-�g`��/��TQɴc�=�:���
��k���㙏
��(�/y4�KV�^oky@��iL�n02�7�< ��}񇧰ׅlםn8ڭ�g��Gl81�z�u'��n^W9�r��\�<�֕�\5��5�t3N�=$st����;����g�G}���͘׮x����8���ي'�eH���y�"[�K땬X�S�l4��V�;l�֌K�d ]Nqc��ԊK7r���;EX���u�M�^7u�1�/h�&tN�J�+G�R���P:s���!�QsT�;ӽ�^�>�)�V��m��s�(H���x6!Z��eV^Y$�&�y@E*�	�~�,1>Wc�}T�R>}�F��ƹ���0,'o,�	�ƞ�j�N��׀�d�Yi�9�$��5�8+���H�-�ٞ��Ty�;���)�`
���Di���B�W�Y1�'�mH55q�l�4kԹρTS���?3��&")N%�s_Q�j�!�$���;���x@�&N��H���yN�ϡ��(*�Aw�_ �K���#���#)�4-̟� �NT��3@3���I��|�`�Y��~`=�,�bpU���w��$j �Y�%��Z�>;�A>��S+��c�.}������p3�$��3/�HkWIax�u[��Bĥ���ƽE���P^D�ң��]���// m�Y�'O�q��ؗ�"O��SzV��lEyb�k�kO��g+J�cN���]����li��3��(DEQ�2�#���\�RE��b�c� �Nt�R!�f��s�L�}����a%V��:o9�j_V"��g]�TI/H+n�k�[�����_����M.         Q   x�3��H����Q(��,V �D�����ԲԼN##]#]##NW���!�i��LH�`�e�Y�RD�r!@\1z\\\ �U1�         �   x���=�0�>EGZ�?��p�:���h���
$�b�<�Oz����R.-���5�<�Υ]q��H��ш$^���c�@u��l o1�Yɿ }]e�A��g�sؑ���(ֿ��c�j�V�� �n�����wB��P:�BM�]��"��a~�����J��^         �   x����J�0���S��!�4i��.���Up=z	ݶi�%d�ު�� �e���3965W�h@`��N*f�$�h�u��"�Plܝ]��\�aw����/)C�6\�tC,��	vٍ�uY�);}�"JeqwZ��0L��{�#���m�-Sh�m����!zݻr�`�������b�U��MYf�����k��xd���7W�$?���LV{^>^��]�L����)�gF)}G�l�         *  x��V]o�6}�ч-⌗��dZ7-\dIQ��hˢ@*q�_?J�dɎ�vO#��s�9�#�X�,Y�.y^��a�0���"N�����#�8J�.E>C}���
�MR�e2�]�Q\[g�ɐ����[�t���]n�%�\�4�W�`9�������T,ע2�O�U�\ |N�%�*�҄9L��h}#9g�w�P���~�"�I�N>�յa}�@j�x�{� ��>�|s}�#%�͍�D*�g��Gw�(d�nE��8�&��iϚJ��գ���w\\�4�K��_m�
�U0p���n�O�ݿ{�������TD^��c/ppk�|�s�H��R+�3s�u�W�	����K�C�"c�+�̉y]�ع�03Y}�P��g%g�-�\���o�<&��X04Y#�H.^�*k�>���ߐ*�R+^}��r]��5�o_�vu�v���"=ʦg)�ǳ=���F���
]j��v�,66,� ���F�C��E����6���ȫ�U���\sP�!!�lk���u���`��k��VuRa93���Q�����A�n�wChhj�1	��8n� �P�U�x�W}����E�}Py��������v��"�J�]u��f2�'�(rE_D���wmƇ~Zrt�Y`dv�6���u]I ���Z��D�y�F77�\ ة�uZ���ה���?��=�ol���.x}lB���Al�im'Թ^��l�l�8�ζ�7T���ɰ�ƷL8����;��v#�`:4��&vc�g�����m	ֈ���� �@;`��d@���n|���LY�2�V��Nza��܄َ�Caڽ0{�{`�p���I'�����T[��ئ}$T��1Ս�.'��AU��NK�7Hgv��弴#�8��v��-�"7���X���Nޞ�;����q�<�)G��'�L�}��0��T��Y)���	~ba�_�\ϡ��n9��O����]��Ɯ����SbH����Q�D�^��z,T��h)�2��!�K�q}�Ǡ�#X��j���5�x��!��v'�7��������?Ks         (   x�3�tN,JM-�2�t-K�+)�2��/�H-*����� ���         .   x�3���/�L�LN,����2�I�KI-�2��/�H-*����� �z6         �  x����n�0���)��&3�5�)�T%�TQ%H�D�<��PL�׏aa�L������'@��U��M��AD�)'��d��]�WQfpm|s{���p�t���W�\��:��:Ŷi������B7��d��	��!'ĲDB�#�j+�1���n}�2�DH�rΥ�,�Y�l�O���R�"c��<��&!
�l�(�K��E���eT~*�`K��,��.��,(����@�a��*Н�c3�COH��/d|HEv(vey
�5Pt���<Δ�f񓱯{37�A �G3L�M����M����زoZ�xm��Ӄ?g�)M���G��;��>-�B����j�[�bs���cP�B��;��X��All: ��I�p!9[*6���Q��	�A.9r�'��l�D/[��� �1 <            x�3�LL�������� $�         �   x�3�4202�50�52W0��20�21�,�tL����T1JT14P���3tvIw6�	�*u�J�1*-051�p6O�(�(�tͭ�����I��1r�4�Ԙ3ll�qA�)�[�m.-H-���L7��,���=... O(F_            x������ � �     
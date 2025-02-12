PGDMP                       }            crypto_wallet     17.2    17.2     ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            >           1262    16388    crypto_wallet     DATABASE     �   CREATE DATABASE "crypto_wallet " WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
     DROP DATABASE "crypto_wallet ";
                     postgres    false            �            1259    16418    price    TABLE       CREATE TABLE public.price (
    id integer NOT NULL,
    symbol character varying(50) NOT NULL,
    currency character varying(50) NOT NULL,
    value numeric(20,8) NOT NULL,
    date date NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.price;
       public         heap r       postgres    false            �            1259    16417    price_id_seq    SEQUENCE     �   CREATE SEQUENCE public.price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.price_id_seq;
       public               postgres    false    222            ?           0    0    price_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;
          public               postgres    false    221            �            1259    16390    role    TABLE     _   CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.role;
       public         heap r       postgres    false            �            1259    16389    role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.role_id_seq;
       public               postgres    false    218            @           0    0    role_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;
          public               postgres    false    217            �            1259    16399    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    role_id integer,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    pswd character varying(255) NOT NULL,
    wallet jsonb DEFAULT '[]'::jsonb,
    refresh_token text,
    expires_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."user";
       public         heap r       postgres    false            �            1259    16398    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public               postgres    false    220            A           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public               postgres    false    219            �           2604    16421    price id    DEFAULT     d   ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);
 7   ALTER TABLE public.price ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    16393    role id    DEFAULT     b   ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);
 6   ALTER TABLE public.role ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            �           2604    16402    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            8          0    16418    price 
   TABLE DATA           N   COPY public.price (id, symbol, currency, value, date, created_at) FROM stdin;
    public               postgres    false    222   �       4          0    16390    role 
   TABLE DATA           (   COPY public.role (id, name) FROM stdin;
    public               postgres    false    218   �       6          0    16399    user 
   TABLE DATA           {   COPY public."user" (id, role_id, name, email, pswd, wallet, refresh_token, expires_at, created_at, updated_at) FROM stdin;
    public               postgres    false    220   �       B           0    0    price_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.price_id_seq', 1, false);
          public               postgres    false    221            C           0    0    role_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.role_id_seq', 1, false);
          public               postgres    false    217            D           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public               postgres    false    219            �           2606    16424    price price_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.price DROP CONSTRAINT price_pkey;
       public                 postgres    false    222            �           2606    16397    role role_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.role DROP CONSTRAINT role_name_key;
       public                 postgres    false    218            �           2606    16395    role role_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public                 postgres    false    218            �           2606    16411    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public                 postgres    false    220            �           2606    16409    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public                 postgres    false    220            �           2606    16412    user user_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_role_id_fkey;
       public               postgres    false    218    4762    220            8      x������ � �      4      x������ � �      6      x������ � �     
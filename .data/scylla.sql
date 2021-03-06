PGDMP          9                z            scylla    14.3    14.3 {    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16384    scylla    DATABASE     [   CREATE DATABASE scylla WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE scylla;
                postgres    false            ?            1259    18299    Brand    TABLE     ?   CREATE TABLE public."Brand" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Brand";
       public         heap    postgres    false            ?            1259    18298    Brand_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Brand_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Brand_id_seq";
       public          postgres    false    222            ?           0    0    Brand_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Brand_id_seq" OWNED BY public."Brand".id;
          public          postgres    false    221            ?            1259    18279    Category    TABLE     q  CREATE TABLE public."Category" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    "typeId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Category";
       public         heap    postgres    false            ?            1259    18278    Category_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Category_id_seq";
       public          postgres    false    220            ?           0    0    Category_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;
          public          postgres    false    219            ?            1259    18308    Color    TABLE     ?   CREATE TABLE public."Color" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Color";
       public         heap    postgres    false            ?            1259    18307    Color_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Color_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Color_id_seq";
       public          postgres    false    224            ?           0    0    Color_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Color_id_seq" OWNED BY public."Color".id;
          public          postgres    false    223            ?            1259    18244 
   Department    TABLE     )  CREATE TABLE public."Department" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Department";
       public         heap    postgres    false            ?            1259    18243    Department_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Department_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Department_id_seq";
       public          postgres    false    216            ?           0    0    Department_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Department_id_seq" OWNED BY public."Department".id;
          public          postgres    false    215            ?            1259    18385    Order    TABLE     '  CREATE TABLE public."Order" (
    id integer NOT NULL,
    phone character varying(255) NOT NULL,
    cart jsonb NOT NULL,
    total double precision NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Order";
       public         heap    postgres    false            ?            1259    18384    Order_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Order_id_seq";
       public          postgres    false    234            ?           0    0    Order_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;
          public          postgres    false    233            ?            1259    18326    Product    TABLE     ?  CREATE TABLE public."Product" (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    price double precision NOT NULL,
    description character varying(1234),
    "inStock" integer DEFAULT 0 NOT NULL,
    sold integer DEFAULT 0 NOT NULL,
    images jsonb NOT NULL,
    "categoryId" integer NOT NULL,
    "brandId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Product";
       public         heap    postgres    false            ?            1259    18366    ProductColor    TABLE     p   CREATE TABLE public."ProductColor" (
    id integer NOT NULL,
    "productId" integer,
    "colorId" integer
);
 "   DROP TABLE public."ProductColor";
       public         heap    postgres    false            ?            1259    18365    ProductColor_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ProductColor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."ProductColor_id_seq";
       public          postgres    false    232            ?           0    0    ProductColor_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."ProductColor_id_seq" OWNED BY public."ProductColor".id;
          public          postgres    false    231            ?            1259    18347    ProductSize    TABLE     n   CREATE TABLE public."ProductSize" (
    id integer NOT NULL,
    "productId" integer,
    "sizeId" integer
);
 !   DROP TABLE public."ProductSize";
       public         heap    postgres    false            ?            1259    18346    ProductSize_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."ProductSize_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ProductSize_id_seq";
       public          postgres    false    230            ?           0    0    ProductSize_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ProductSize_id_seq" OWNED BY public."ProductSize".id;
          public          postgres    false    229            ?            1259    18325    Product_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          postgres    false    228            ?           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          postgres    false    227            ?            1259    16398    Role    TABLE     ?   CREATE TABLE public."Role" (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Role";
       public         heap    postgres    false            ?            1259    16397    Role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_id_seq";
       public          postgres    false    212            ?           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    211            ?            1259    18317    Size    TABLE     ?   CREATE TABLE public."Size" (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Size";
       public         heap    postgres    false            ?            1259    18316    Size_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Size_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Size_id_seq";
       public          postgres    false    226            ?           0    0    Size_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Size_id_seq" OWNED BY public."Size".id;
          public          postgres    false    225            ?            1259    18259    Type    TABLE     s  CREATE TABLE public."Type" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    "departmentId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Type";
       public         heap    postgres    false            ?            1259    18258    Type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."Type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Type_id_seq";
       public          postgres    false    218            ?           0    0    Type_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Type_id_seq" OWNED BY public."Type".id;
          public          postgres    false    217            ?            1259    16386    User    TABLE     k  CREATE TABLE public."User" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            ?            1259    16409    UserRole    TABLE     h   CREATE TABLE public."UserRole" (
    id integer NOT NULL,
    "userId" integer,
    "roleId" integer
);
    DROP TABLE public."UserRole";
       public         heap    postgres    false            ?            1259    16408    UserRole_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."UserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."UserRole_id_seq";
       public          postgres    false    214            ?           0    0    UserRole_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."UserRole_id_seq" OWNED BY public."UserRole".id;
          public          postgres    false    213            ?            1259    16385    User_id_seq    SEQUENCE     ?   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    210            ?           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    209            ?           2604    18302    Brand id    DEFAULT     h   ALTER TABLE ONLY public."Brand" ALTER COLUMN id SET DEFAULT nextval('public."Brand_id_seq"'::regclass);
 9   ALTER TABLE public."Brand" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    18282    Category id    DEFAULT     n   ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);
 <   ALTER TABLE public."Category" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            ?           2604    18311    Color id    DEFAULT     h   ALTER TABLE ONLY public."Color" ALTER COLUMN id SET DEFAULT nextval('public."Color_id_seq"'::regclass);
 9   ALTER TABLE public."Color" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            ?           2604    18247    Department id    DEFAULT     r   ALTER TABLE ONLY public."Department" ALTER COLUMN id SET DEFAULT nextval('public."Department_id_seq"'::regclass);
 >   ALTER TABLE public."Department" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            ?           2604    18388    Order id    DEFAULT     h   ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);
 9   ALTER TABLE public."Order" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            ?           2604    18329 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            ?           2604    18369    ProductColor id    DEFAULT     v   ALTER TABLE ONLY public."ProductColor" ALTER COLUMN id SET DEFAULT nextval('public."ProductColor_id_seq"'::regclass);
 @   ALTER TABLE public."ProductColor" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            ?           2604    18350    ProductSize id    DEFAULT     t   ALTER TABLE ONLY public."ProductSize" ALTER COLUMN id SET DEFAULT nextval('public."ProductSize_id_seq"'::regclass);
 ?   ALTER TABLE public."ProductSize" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            ?           2604    16401    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ?           2604    18320    Size id    DEFAULT     f   ALTER TABLE ONLY public."Size" ALTER COLUMN id SET DEFAULT nextval('public."Size_id_seq"'::regclass);
 8   ALTER TABLE public."Size" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            ?           2604    18262    Type id    DEFAULT     f   ALTER TABLE ONLY public."Type" ALTER COLUMN id SET DEFAULT nextval('public."Type_id_seq"'::regclass);
 8   ALTER TABLE public."Type" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            ?           2604    16389    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            ?           2604    16412    UserRole id    DEFAULT     n   ALTER TABLE ONLY public."UserRole" ALTER COLUMN id SET DEFAULT nextval('public."UserRole_id_seq"'::regclass);
 <   ALTER TABLE public."UserRole" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            w          0    18299    Brand 
   TABLE DATA           E   COPY public."Brand" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   :?       u          0    18279    Category 
   TABLE DATA           l   COPY public."Category" (id, name, description, slug, image, "typeId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   ??       y          0    18308    Color 
   TABLE DATA           E   COPY public."Color" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    224   2?       q          0    18244 
   Department 
   TABLE DATA           ]   COPY public."Department" (id, name, description, slug, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   ??       ?          0    18385    Order 
   TABLE DATA           ]   COPY public."Order" (id, phone, cart, total, "userId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    234   ??       }          0    18326    Product 
   TABLE DATA           ?   COPY public."Product" (id, title, price, description, "inStock", sold, images, "categoryId", "brandId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    228   ??       ?          0    18366    ProductColor 
   TABLE DATA           D   COPY public."ProductColor" (id, "productId", "colorId") FROM stdin;
    public          postgres    false    232   ՛                 0    18347    ProductSize 
   TABLE DATA           B   COPY public."ProductSize" (id, "productId", "sizeId") FROM stdin;
    public          postgres    false    230   ??       m          0    16398    Role 
   TABLE DATA           R   COPY public."Role" (id, value, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212   6?       {          0    18317    Size 
   TABLE DATA           E   COPY public."Size" (id, value, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    226   ??       s          0    18259    Type 
   TABLE DATA           n   COPY public."Type" (id, name, description, slug, image, "departmentId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   \?       k          0    16386    User 
   TABLE DATA           ]   COPY public."User" (id, name, email, password, avatar, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   ??       o          0    16409    UserRole 
   TABLE DATA           <   COPY public."UserRole" (id, "userId", "roleId") FROM stdin;
    public          postgres    false    214   #?       ?           0    0    Brand_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Brand_id_seq"', 2, true);
          public          postgres    false    221            ?           0    0    Category_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Category_id_seq"', 1, true);
          public          postgres    false    219            ?           0    0    Color_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Color_id_seq"', 2, true);
          public          postgres    false    223            ?           0    0    Department_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Department_id_seq"', 1, true);
          public          postgres    false    215            ?           0    0    Order_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Order_id_seq"', 1, true);
          public          postgres    false    233            ?           0    0    ProductColor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ProductColor_id_seq"', 2, true);
          public          postgres    false    231            ?           0    0    ProductSize_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."ProductSize_id_seq"', 6, true);
          public          postgres    false    229            ?           0    0    Product_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Product_id_seq"', 2, true);
          public          postgres    false    227            ?           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 2, true);
          public          postgres    false    211            ?           0    0    Size_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Size_id_seq"', 10, true);
          public          postgres    false    225            ?           0    0    Type_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Type_id_seq"', 1, true);
          public          postgres    false    217            ?           0    0    UserRole_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."UserRole_id_seq"', 3, true);
          public          postgres    false    213            ?           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 3, true);
          public          postgres    false    209            ?           2606    18306    Brand Brand_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_name_key";
       public            postgres    false    222            ?           2606    18304    Brand Brand_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_pkey";
       public            postgres    false    222            ?           2606    18288 !   Category Category_description_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_description_key" UNIQUE (description);
 O   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_description_key";
       public            postgres    false    220            ?           2606    18292    Category Category_image_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_image_key" UNIQUE (image);
 I   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_image_key";
       public            postgres    false    220            ?           2606    18286    Category Category_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public            postgres    false    220            ?           2606    18290    Category Category_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_slug_key" UNIQUE (slug);
 H   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_slug_key";
       public            postgres    false    220            ?           2606    18315    Color Color_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "Color_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Color" DROP CONSTRAINT "Color_name_key";
       public            postgres    false    224            ?           2606    18313    Color Color_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "Color_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Color" DROP CONSTRAINT "Color_pkey";
       public            postgres    false    224            ?           2606    18255 %   Department Department_description_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_description_key" UNIQUE (description);
 S   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_description_key";
       public            postgres    false    216            ?           2606    18253    Department Department_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_name_key";
       public            postgres    false    216            ?           2606    18251    Department Department_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_pkey";
       public            postgres    false    216            ?           2606    18257    Department Department_slug_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_slug_key" UNIQUE (slug);
 L   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_slug_key";
       public            postgres    false    216            ?           2606    18392    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    234            ?           2606    18371    ProductColor ProductColor_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_pkey";
       public            postgres    false    232            ?           2606    18373 /   ProductColor ProductColor_productId_colorId_key 
   CONSTRAINT     ?   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_productId_colorId_key" UNIQUE ("productId", "colorId");
 ]   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_productId_colorId_key";
       public            postgres    false    232    232            ?           2606    18352    ProductSize ProductSize_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_pkey";
       public            postgres    false    230            ?           2606    18354 ,   ProductSize ProductSize_productId_sizeId_key 
   CONSTRAINT     |   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_productId_sizeId_key" UNIQUE ("productId", "sizeId");
 Z   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_productId_sizeId_key";
       public            postgres    false    230    230            ?           2606    18335    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    228            ?           2606    16405    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    212            ?           2606    16407    Role Role_value_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_value_key" UNIQUE (value);
 A   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_value_key";
       public            postgres    false    212            ?           2606    18322    Size Size_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Size"
    ADD CONSTRAINT "Size_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Size" DROP CONSTRAINT "Size_pkey";
       public            postgres    false    226            ?           2606    18324    Size Size_value_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Size"
    ADD CONSTRAINT "Size_value_key" UNIQUE (value);
 A   ALTER TABLE ONLY public."Size" DROP CONSTRAINT "Size_value_key";
       public            postgres    false    226            ?           2606    18268    Type Type_description_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_description_key" UNIQUE (description);
 G   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_description_key";
       public            postgres    false    218            ?           2606    18272    Type Type_image_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_image_key" UNIQUE (image);
 A   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_image_key";
       public            postgres    false    218            ?           2606    18266    Type Type_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_pkey";
       public            postgres    false    218            ?           2606    18270    Type Type_slug_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_slug_key" UNIQUE (slug);
 @   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_slug_key";
       public            postgres    false    218            ?           2606    16414    UserRole UserRole_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_pkey";
       public            postgres    false    214            ?           2606    16416 #   UserRole UserRole_userId_roleId_key 
   CONSTRAINT     p   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_userId_roleId_key" UNIQUE ("userId", "roleId");
 Q   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_userId_roleId_key";
       public            postgres    false    214    214            ?           2606    16396    User User_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_email_key";
       public            postgres    false    210            ?           2606    16394    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    210            ?           2606    18293    Category Category_typeId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."Type"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_typeId_fkey";
       public          postgres    false    220    218    4273            ?           2606    18393    Order Order_userId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_userId_fkey";
       public          postgres    false    210    4251    234            ?           2606    18379 &   ProductColor ProductColor_colorId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES public."Color"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_colorId_fkey";
       public          postgres    false    224    232    4291            ?           2606    18374 (   ProductColor ProductColor_productId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_productId_fkey";
       public          postgres    false    4297    232    228            ?           2606    18355 &   ProductSize ProductSize_productId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_productId_fkey";
       public          postgres    false    230    4297    228            ?           2606    18360 #   ProductSize ProductSize_sizeId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES public."Size"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_sizeId_fkey";
       public          postgres    false    230    4293    226            ?           2606    18341    Product Product_brandId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brand"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_brandId_fkey";
       public          postgres    false    228    222    4287            ?           2606    18336    Product Product_categoryId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_categoryId_fkey";
       public          postgres    false    228    220    4281            ?           2606    18273    Type Type_departmentId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public."Department"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_departmentId_fkey";
       public          postgres    false    216    218    4265            ?           2606    16422    UserRole UserRole_roleId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_roleId_fkey";
       public          postgres    false    4253    214    212            ?           2606    16417    UserRole UserRole_userId_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_userId_fkey";
       public          postgres    false    214    4251    210            w   O   x?3?trw?4202?50?52R04?25?2??3?60?)?e??????????????????@????!HR\1z\\\ [      u   ?   x?3估?b???6\츰???s??mA?[.6????Vegg???&%gdgr&??????&Z?蚘Y?&?뚙Z?????e?sr???)?Y?Z?Yk???????? e?:B      y   K   x?3??0????/v_??id`d?k`?kd?`hfejheh?gfb?m`?G??b?6 ބ?s=cKs?????b???? J?'6      q   \   x?3??0?b??m?/츰?b7??xaׅ}v*\?w??[/???-??H??̫?4202?50?52R04?25?2??353?60?#????? C?*?      ?   ?  x????nEǯ??X?
T?j?g?w-jQ%$P?T?????qj????A-??Ѐ
?z???	\?nݦv_a??83?&?bbKpы\?????9?sά???+Ꝉ?w-5??d??o*??RH5??7?Y?Yl	???4?n??u?Iۚ?M?v?Ŕ",?V?Fu????	?{?jڭ??t6f?߀?Y`??T~M?߯BUFt9"?a?K????.@?s?|9"'!??
?%?BDVF??D?t筦[a???n:߃]?㱯]?}??
?:??B~*??\???v?֕?fO?Qv???^,Nx(?*?-	O???)B??S?,V
??n$??H???it?3?????Ӭ??????F???ht\?Ǝٲ?.ՊMS?Rj????????dE$??6?????rf,??P!&?qA5?-SH%?(?Z?4?Z?։??A???W???d??:?T
y?f?????V??(r?
n??w_??,?.?~???Nv????o7,jwc?g?q??;%+˹B?hyk??
IN"?-???"???={F???4??*?$L?~?n?u?]?ѯ?ѳ????FA~0????_v?.???
D?FtH?\J4',J~???#???y?~p?|m?A6???u6?N?	<;8?|??}???t???Q??d????q6???p
@ٟ`{??????? p*0?8????$.p??c0:?F???u?#?Ѓ`.?'B0?}?,?RrD}p;Y??pdc?????P
??O6{???Oh?A??}???	????l???? ?|N|BS_???{??"L?ȯG ?g??????'??L氝????7???????ϱ`?(???5@np2???]*.?k??ذ?????D6??|???r^~??}(???y?F???;p?y?ì/?#T????ߎw?揫???\7F???R9?Ã??zz!?1?v??????=;??S?󖇾?????Wh??}+f~?lBߊ?D\4?зb6??&t?lBK??7???$x??o;fwY
??q????p.\4??????u+**d?*7?$\<?йA?.??T(???? ??q?.P?mi1cQb4?;V6&T??+??rd?(A,VBE`P7i?McfS?S$?4A?(?4&Q&?f&?'?V&?F??A+f???&1?)[h?"J?UP??D??QSW?ȔE?,??? ??@b?X,?愗?? t9 ?@?k?J?F????	Qc$?T_?삣???????W?]2      }   ?  x??T?n9]w???v?-??ʒ???,????B ?B?m:Ƞ?Z??@????t?"??/?4?n:?h?dQ?*?s?9?^?|?????)????"??_??> ?}<?F?Qz??y??P??|????;>"i?O???I_?:???I?????M埤U?棴??5V?҆?' n? ?	I??????|t??P?8P ?e
?2?a????H?i???u??ba
?"S.!V޳?\B%Gs?]???V`K??4?J^B?P???#d-~???y-h?3???'?%?\ ???~z?ǀ?E?u-hS{????SR[?5???H?m?P;?š???Vl?\???.??H<???~??ʌlG?ԆȐ???RJQ*??[?f??w["-H?X?|
??,?*s?f????ϗ(???a;Ԉ?Af>.?.~???)??K???i?H????<̳??	?c??q?Xi????\e????:?ƍ???~A? <U&?O]?:u??c?Q???{xgL?e???R7-UZ8?Fi???&????B?u?<? ??-?Ai?e.(a?i*?6l??`BP????-??pg?`?jHH>Q???????>??'??-Xk?P?j??pi?bO??Lʦ????)mml?0=??fT?BQ?5??ն??a?????@M:???1Ω??;?[?X??Z.??ZS/???A?Y??m????Zڸ????X?P??bk?㶥??V{d??M!?^?@?	ӿ?)l?)nM????'?N      ?      x?3?4?4?2?B?=... 
         *   x?3?4?4?2??\?@҂˄?(b
$͹̀?W? h??      m   u   x?3?tt?????0?{.츰????.6\?p??¾??FFF?????
??V??@?glb?m`?G?ˈ34?5?????.???sa;??6s+?????L?????p)?=... o?<?      {   ?   x?uһ?0???7E??ŇEy??G??չ????AC?????:????j\?j??x???n^nBH&?????&??I|j???M(?&??6y?	?)????aJ???u???&??)???EӇ???L?y?	ä?NYZο?C????l?      s   ?   x?3??0?[/l?8/̹?|a????.l?دpa?\niUFqvbe?n~JjUFJ"?E??E?q????YR???????EJ???A?e?y???A?E?^VA:?!??????????????????????????1)?=... ?:9y      k     x?}?=R?@ @?zs
:?e??I?Q	??86	YLD?Bb?x??{??F?T???k^?a?_????P?U??\??F?F????I6-}?%=o#BYA?Wn??3???6?,??vy? RG???#?m?m?!????A?~?????Y?!&?G??`???wUU??????,??.?L???7s?9Y??ʤ?S?V?0?̴?????2(X?y?d?-???I??m??
?u?J`??"Py5?s:K??H???tb?G??7?T7??/?????YH??q???tl      o      x?3?4?4?2?B.cNcNC?=... !??     
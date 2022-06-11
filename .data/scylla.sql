PGDMP         5                z            scylla    14.3    14.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16385    scylla    DATABASE     [   CREATE DATABASE scylla WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE scylla;
                postgres    false            �            1259    16484    Brand    TABLE     �   CREATE TABLE public."Brand" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Brand";
       public         heap    postgres    false            �            1259    16483    Brand_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Brand_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Brand_id_seq";
       public          postgres    false    222            �           0    0    Brand_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Brand_id_seq" OWNED BY public."Brand".id;
          public          postgres    false    221            �            1259    16464    Category    TABLE     q  CREATE TABLE public."Category" (
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
       public         heap    postgres    false            �            1259    16463    Category_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Category_id_seq";
       public          postgres    false    220            �           0    0    Category_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;
          public          postgres    false    219            �            1259    16493    Color    TABLE     �   CREATE TABLE public."Color" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Color";
       public         heap    postgres    false            �            1259    16492    Color_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Color_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Color_id_seq";
       public          postgres    false    224            �           0    0    Color_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Color_id_seq" OWNED BY public."Color".id;
          public          postgres    false    223            �            1259    16429 
   Department    TABLE     )  CREATE TABLE public."Department" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."Department";
       public         heap    postgres    false            �            1259    16428    Department_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Department_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Department_id_seq";
       public          postgres    false    216            �           0    0    Department_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Department_id_seq" OWNED BY public."Department".id;
          public          postgres    false    215            �            1259    16570    Order    TABLE     ;  CREATE TABLE public."Order" (
    id integer NOT NULL,
    phone character varying(255) NOT NULL,
    comment character varying(255) NOT NULL,
    total double precision NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �            1259    16584    OrderProduct    TABLE     �   CREATE TABLE public."OrderProduct" (
    id integer NOT NULL,
    "orderId" integer,
    "productId" integer,
    quantity integer,
    "selectedSize" character varying(255)
);
 "   DROP TABLE public."OrderProduct";
       public         heap    postgres    false            �            1259    16583    OrderProduct_id_seq    SEQUENCE     �   CREATE SEQUENCE public."OrderProduct_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."OrderProduct_id_seq";
       public          postgres    false    234            �           0    0    OrderProduct_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."OrderProduct_id_seq" OWNED BY public."OrderProduct".id;
          public          postgres    false    233            �            1259    16569    Order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Order_id_seq";
       public          postgres    false    232            �           0    0    Order_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;
          public          postgres    false    231            �            1259    16511    Product    TABLE     �  CREATE TABLE public."Product" (
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
       public         heap    postgres    false            �            1259    16551    ProductColor    TABLE     p   CREATE TABLE public."ProductColor" (
    id integer NOT NULL,
    "productId" integer,
    "colorId" integer
);
 "   DROP TABLE public."ProductColor";
       public         heap    postgres    false            �            1259    16550    ProductColor_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ProductColor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."ProductColor_id_seq";
       public          postgres    false    230            �           0    0    ProductColor_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."ProductColor_id_seq" OWNED BY public."ProductColor".id;
          public          postgres    false    229            �            1259    16532    ProductSize    TABLE     n   CREATE TABLE public."ProductSize" (
    id integer NOT NULL,
    "productId" integer,
    "sizeId" integer
);
 !   DROP TABLE public."ProductSize";
       public         heap    postgres    false            �            1259    16531    ProductSize_id_seq    SEQUENCE     �   CREATE SEQUENCE public."ProductSize_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."ProductSize_id_seq";
       public          postgres    false    228            �           0    0    ProductSize_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."ProductSize_id_seq" OWNED BY public."ProductSize".id;
          public          postgres    false    227            �            1259    16510    Product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          postgres    false    226            �           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          postgres    false    225            �            1259    16399    Role    TABLE     �   CREATE TABLE public."Role" (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Role";
       public         heap    postgres    false            �            1259    16398    Role_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Role_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Role_id_seq";
       public          postgres    false    212            �           0    0    Role_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Role_id_seq" OWNED BY public."Role".id;
          public          postgres    false    211            �            1259    16604    Size    TABLE     �   CREATE TABLE public."Size" (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."Size";
       public         heap    postgres    false            �            1259    16603    Size_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Size_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Size_id_seq";
       public          postgres    false    236            �           0    0    Size_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Size_id_seq" OWNED BY public."Size".id;
          public          postgres    false    235            �            1259    16444    Type    TABLE     s  CREATE TABLE public."Type" (
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
       public         heap    postgres    false            �            1259    16443    Type_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."Type_id_seq";
       public          postgres    false    218            �           0    0    Type_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."Type_id_seq" OWNED BY public."Type".id;
          public          postgres    false    217            �            1259    16387    User    TABLE     k  CREATE TABLE public."User" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    avatar character varying(255) DEFAULT ''::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    16410    UserRole    TABLE     h   CREATE TABLE public."UserRole" (
    id integer NOT NULL,
    "userId" integer,
    "roleId" integer
);
    DROP TABLE public."UserRole";
       public         heap    postgres    false            �            1259    16409    UserRole_id_seq    SEQUENCE     �   CREATE SEQUENCE public."UserRole_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."UserRole_id_seq";
       public          postgres    false    214            �           0    0    UserRole_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."UserRole_id_seq" OWNED BY public."UserRole".id;
          public          postgres    false    213            �            1259    16386    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    210            �           0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    209            �           2604    16487    Brand id    DEFAULT     h   ALTER TABLE ONLY public."Brand" ALTER COLUMN id SET DEFAULT nextval('public."Brand_id_seq"'::regclass);
 9   ALTER TABLE public."Brand" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    16467    Category id    DEFAULT     n   ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);
 <   ALTER TABLE public."Category" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16496    Color id    DEFAULT     h   ALTER TABLE ONLY public."Color" ALTER COLUMN id SET DEFAULT nextval('public."Color_id_seq"'::regclass);
 9   ALTER TABLE public."Color" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    16432    Department id    DEFAULT     r   ALTER TABLE ONLY public."Department" ALTER COLUMN id SET DEFAULT nextval('public."Department_id_seq"'::regclass);
 >   ALTER TABLE public."Department" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16573    Order id    DEFAULT     h   ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);
 9   ALTER TABLE public."Order" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    16587    OrderProduct id    DEFAULT     v   ALTER TABLE ONLY public."OrderProduct" ALTER COLUMN id SET DEFAULT nextval('public."OrderProduct_id_seq"'::regclass);
 @   ALTER TABLE public."OrderProduct" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    16514 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16554    ProductColor id    DEFAULT     v   ALTER TABLE ONLY public."ProductColor" ALTER COLUMN id SET DEFAULT nextval('public."ProductColor_id_seq"'::regclass);
 @   ALTER TABLE public."ProductColor" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    16535    ProductSize id    DEFAULT     t   ALTER TABLE ONLY public."ProductSize" ALTER COLUMN id SET DEFAULT nextval('public."ProductSize_id_seq"'::regclass);
 ?   ALTER TABLE public."ProductSize" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    16402    Role id    DEFAULT     f   ALTER TABLE ONLY public."Role" ALTER COLUMN id SET DEFAULT nextval('public."Role_id_seq"'::regclass);
 8   ALTER TABLE public."Role" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    16607    Size id    DEFAULT     f   ALTER TABLE ONLY public."Size" ALTER COLUMN id SET DEFAULT nextval('public."Size_id_seq"'::regclass);
 8   ALTER TABLE public."Size" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    16447    Type id    DEFAULT     f   ALTER TABLE ONLY public."Type" ALTER COLUMN id SET DEFAULT nextval('public."Type_id_seq"'::regclass);
 8   ALTER TABLE public."Type" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16390    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    16413    UserRole id    DEFAULT     n   ALTER TABLE ONLY public."UserRole" ALTER COLUMN id SET DEFAULT nextval('public."UserRole_id_seq"'::regclass);
 <   ALTER TABLE public."UserRole" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �          0    16484    Brand 
   TABLE DATA           E   COPY public."Brand" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   Ý       �          0    16464    Category 
   TABLE DATA           l   COPY public."Category" (id, name, description, slug, image, "typeId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   ��       �          0    16493    Color 
   TABLE DATA           E   COPY public."Color" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    224   ʠ       |          0    16429 
   Department 
   TABLE DATA           ]   COPY public."Department" (id, name, description, slug, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   D�       �          0    16570    Order 
   TABLE DATA           `   COPY public."Order" (id, phone, comment, total, "userId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    232   ա       �          0    16584    OrderProduct 
   TABLE DATA           ^   COPY public."OrderProduct" (id, "orderId", "productId", quantity, "selectedSize") FROM stdin;
    public          postgres    false    234   �       �          0    16511    Product 
   TABLE DATA           �   COPY public."Product" (id, title, price, description, "inStock", sold, images, "categoryId", "brandId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    226   �       �          0    16551    ProductColor 
   TABLE DATA           D   COPY public."ProductColor" (id, "productId", "colorId") FROM stdin;
    public          postgres    false    230   ,�       �          0    16532    ProductSize 
   TABLE DATA           B   COPY public."ProductSize" (id, "productId", "sizeId") FROM stdin;
    public          postgres    false    228   I�       x          0    16399    Role 
   TABLE DATA           R   COPY public."Role" (id, value, description, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212   f�       �          0    16604    Size 
   TABLE DATA           E   COPY public."Size" (id, value, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    236   ��       ~          0    16444    Type 
   TABLE DATA           n   COPY public."Type" (id, name, description, slug, image, "departmentId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   أ       v          0    16387    User 
   TABLE DATA           ]   COPY public."User" (id, name, email, password, avatar, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   ��       z          0    16410    UserRole 
   TABLE DATA           <   COPY public."UserRole" (id, "userId", "roleId") FROM stdin;
    public          postgres    false    214   �       �           0    0    Brand_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Brand_id_seq"', 1, false);
          public          postgres    false    221            �           0    0    Category_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Category_id_seq"', 11, true);
          public          postgres    false    219            �           0    0    Color_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Color_id_seq"', 3, true);
          public          postgres    false    223            �           0    0    Department_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Department_id_seq"', 2, true);
          public          postgres    false    215            �           0    0    OrderProduct_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."OrderProduct_id_seq"', 1, false);
          public          postgres    false    233            �           0    0    Order_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Order_id_seq"', 1, false);
          public          postgres    false    231            �           0    0    ProductColor_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."ProductColor_id_seq"', 1, false);
          public          postgres    false    229            �           0    0    ProductSize_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."ProductSize_id_seq"', 1, false);
          public          postgres    false    227            �           0    0    Product_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Product_id_seq"', 1, false);
          public          postgres    false    225            �           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 2, true);
          public          postgres    false    211            �           0    0    Size_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Size_id_seq"', 16, true);
          public          postgres    false    235            �           0    0    Type_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Type_id_seq"', 6, true);
          public          postgres    false    217            �           0    0    UserRole_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."UserRole_id_seq"', 1, true);
          public          postgres    false    213            �           0    0    User_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."User_id_seq"', 1, true);
          public          postgres    false    209            �           2606    16491    Brand Brand_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_name_key";
       public            postgres    false    222            �           2606    16489    Brand Brand_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_pkey";
       public            postgres    false    222            �           2606    16473 !   Category Category_description_key 
   CONSTRAINT     g   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_description_key" UNIQUE (description);
 O   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_description_key";
       public            postgres    false    220            �           2606    16477    Category Category_image_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_image_key" UNIQUE (image);
 I   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_image_key";
       public            postgres    false    220            �           2606    16471    Category Category_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public            postgres    false    220            �           2606    16475    Category Category_slug_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_slug_key" UNIQUE (slug);
 H   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_slug_key";
       public            postgres    false    220            �           2606    16500    Color Color_name_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "Color_name_key" UNIQUE (name);
 B   ALTER TABLE ONLY public."Color" DROP CONSTRAINT "Color_name_key";
       public            postgres    false    224            �           2606    16498    Color Color_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "Color_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Color" DROP CONSTRAINT "Color_pkey";
       public            postgres    false    224            �           2606    16440 %   Department Department_description_key 
   CONSTRAINT     k   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_description_key" UNIQUE (description);
 S   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_description_key";
       public            postgres    false    216            �           2606    16438    Department Department_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_name_key" UNIQUE (name);
 L   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_name_key";
       public            postgres    false    216            �           2606    16436    Department Department_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_pkey";
       public            postgres    false    216            �           2606    16442    Department Department_slug_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Department"
    ADD CONSTRAINT "Department_slug_key" UNIQUE (slug);
 L   ALTER TABLE ONLY public."Department" DROP CONSTRAINT "Department_slug_key";
       public            postgres    false    216            �           2606    16591 /   OrderProduct OrderProduct_orderId_productId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "OrderProduct_orderId_productId_key" UNIQUE ("orderId", "productId");
 ]   ALTER TABLE ONLY public."OrderProduct" DROP CONSTRAINT "OrderProduct_orderId_productId_key";
       public            postgres    false    234    234            �           2606    16589    OrderProduct OrderProduct_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "OrderProduct_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."OrderProduct" DROP CONSTRAINT "OrderProduct_pkey";
       public            postgres    false    234            �           2606    16577    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    232            �           2606    16556    ProductColor ProductColor_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_pkey";
       public            postgres    false    230            �           2606    16558 /   ProductColor ProductColor_productId_colorId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_productId_colorId_key" UNIQUE ("productId", "colorId");
 ]   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_productId_colorId_key";
       public            postgres    false    230    230            �           2606    16537    ProductSize ProductSize_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_pkey";
       public            postgres    false    228            �           2606    16539 ,   ProductSize ProductSize_productId_sizeId_key 
   CONSTRAINT     |   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_productId_sizeId_key" UNIQUE ("productId", "sizeId");
 Z   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_productId_sizeId_key";
       public            postgres    false    228    228            �           2606    16520    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            postgres    false    226            �           2606    16406    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    212            �           2606    16408    Role Role_value_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_value_key" UNIQUE (value);
 A   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_value_key";
       public            postgres    false    212            �           2606    16609    Size Size_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Size"
    ADD CONSTRAINT "Size_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Size" DROP CONSTRAINT "Size_pkey";
       public            postgres    false    236            �           2606    16611    Size Size_value_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Size"
    ADD CONSTRAINT "Size_value_key" UNIQUE (value);
 A   ALTER TABLE ONLY public."Size" DROP CONSTRAINT "Size_value_key";
       public            postgres    false    236            �           2606    16453    Type Type_description_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_description_key" UNIQUE (description);
 G   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_description_key";
       public            postgres    false    218            �           2606    16457    Type Type_image_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_image_key" UNIQUE (image);
 A   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_image_key";
       public            postgres    false    218            �           2606    16451    Type Type_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_pkey";
       public            postgres    false    218            �           2606    16455    Type Type_slug_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_slug_key" UNIQUE (slug);
 @   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_slug_key";
       public            postgres    false    218            �           2606    16415    UserRole UserRole_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_pkey";
       public            postgres    false    214            �           2606    16417 #   UserRole UserRole_userId_roleId_key 
   CONSTRAINT     p   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_userId_roleId_key" UNIQUE ("userId", "roleId");
 Q   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_userId_roleId_key";
       public            postgres    false    214    214            �           2606    16397    User User_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);
 A   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_email_key";
       public            postgres    false    210            �           2606    16395    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    210            �           2606    16478    Category Category_typeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public."Type"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_typeId_fkey";
       public          postgres    false    220    218    4279            �           2606    16592 &   OrderProduct OrderProduct_orderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "OrderProduct_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."OrderProduct" DROP CONSTRAINT "OrderProduct_orderId_fkey";
       public          postgres    false    234    232    4309            �           2606    16597 (   OrderProduct OrderProduct_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."OrderProduct"
    ADD CONSTRAINT "OrderProduct_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."OrderProduct" DROP CONSTRAINT "OrderProduct_productId_fkey";
       public          postgres    false    234    4299    226            �           2606    16578    Order Order_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_userId_fkey";
       public          postgres    false    232    210    4257            �           2606    16564 &   ProductColor ProductColor_colorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES public."Color"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_colorId_fkey";
       public          postgres    false    4297    230    224            �           2606    16559 (   ProductColor ProductColor_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProductColor"
    ADD CONSTRAINT "ProductColor_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."ProductColor" DROP CONSTRAINT "ProductColor_productId_fkey";
       public          postgres    false    226    4299    230            �           2606    16540 &   ProductSize ProductSize_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_productId_fkey";
       public          postgres    false    4299    226    228            �           2606    16526    Product Product_brandId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public."Brand"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_brandId_fkey";
       public          postgres    false    4293    226    222            �           2606    16521    Product Product_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_categoryId_fkey";
       public          postgres    false    4287    226    220            �           2606    16458    Type Type_departmentId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_departmentId_fkey" FOREIGN KEY ("departmentId") REFERENCES public."Department"(id) ON UPDATE CASCADE;
 I   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_departmentId_fkey";
       public          postgres    false    4271    216    218            �           2606    16423    UserRole UserRole_roleId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Role"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_roleId_fkey";
       public          postgres    false    4259    214    212            �           2606    16418    UserRole UserRole_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public."UserRole" DROP CONSTRAINT "UserRole_userId_fkey";
       public          postgres    false    210    214    4257            �      x������ � �      �   �  x�u��jG�u�SxoNS�Խ�%��J�����d0Bv!���	Ǝ��o�j9�ښ�r�o���_u�+?MWӏ�Cyߕ_����t=�(�K�l����d���_�O6]p�1�-p�-D�fN+�`�pQ�>?�#FL���(��)�'=u��Jy[�L?�dյN��޻�q�Y�H���?D��J������}44��*�yW��n��Uq[>6���2�/���*���G.!#&XfDl,�lC[�gJ{C��zQ�-�U�|j7�Uz���bsV����� �� ���F��{��Ft�s���2�(��lk����]�e���늺-7��X�'���n��Z�
�s��w�\��Td	=3�K�T5J=���*�UW�����u��rI��>�n��MP�gH�J�+����s�XL�6K���ZWe��+?�7�c�OE4��σ|!����|���D�d	��
�'��L,D��3
��P������&�~�^�3��;~W����W����틳�{�=��Fe����}��A���T$��_@f�l@e�`��+�M�7�{���ŶwKS���3OV�`�#H�8�d�$�F��":$��YW��[��p�U���b
�nw�q�(K!�l�&򺚲͕�Y��.�M8r��i��uw�w忺S{{I�wvzv��|='�G)s^��[���-��i��(� T˵��o���?���      �   j   x�}̱	�0E�:
{1���D2���[9��q��F�X(hq��#�c�jԩ6.6@d��zM��?K�pf9z�H�->�{�7��p�z�C�6"���Ί�	��7�      |   �   x�3�0�b�m�/츰�b7��xaׅ}v*\�w��[/���-��H��̫�4202�50�54T04�2��26�341�60�#�e�yaР�;aVA� �v�ZU���W��*S=ScS�V���b���� HUm      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      x   w   x�3�tt����0�{.츰����.6\�p��¾��FFF�f���
��VFfV�Fz�&���x���8C�]�8/̿����=��M`3����ZM,��L̰�
������ g]<�      �   �   x�u�;!E��^E�(��YK�������ԇ'ąAH���0���ǒI���T2�шQ.7��Z჌��>�ٍ)L��&t�QxP�YO� +"��������|R����p��L}5#3+��K��� �z�	���N}��D9}��S�~?�ǟ�C��:�Մ�T�BV��:Խz�A��J�ōlj�݄���u��GU{r@�VׁI��|~	D0��      ~   �  x�}�͊1�u�)z/��7�I*�,nR��u���W�TЕ+�Z��gH��i����j	�S��sBM�Z~�C���}S��7�v�.we?~\�ߓ��v��\�+�1���7�r��jP2��4����F��$Fվx���F����VD�V=ʖ�~��?��GݷJ�>~X�=$ٰ}۠��a��Y��j�F#��
D)ڰ�r=c��]`M"����U�a���zލ����*������M�l���U=g+��Ȟ�S�:U����2������#�8s�G�OF�\���Gޭӫ��I;��]���Z���Nm����)�{�9��������LdǑ�DOdb}{����`x v��s,v�ƥ�&�0gF�<;�=u>r��9�,��K`�T�� �-�ڜRZ���*�[�N"�B�Jya�      v   }   x�3�0�¦.��,I-.q zE��*FI*�*>ia�!�Q���z�%^zf��YE���n��QQ�U�a.A^UޮF��FFF�f���
��VF�V�&z��Ƹe�b���� O�'�      z      x�3�4�4����� �Y     
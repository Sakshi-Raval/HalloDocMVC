PGDMP  $    '                |            HalloDoc    16.1    16.1    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    32781    HalloDoc    DATABASE     }   CREATE DATABASE "HalloDoc" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "HalloDoc";
                postgres    false                       1259    57358    EncounterForm    TABLE     �  CREATE TABLE public."EncounterForm" (
    "EncounterFormId" integer NOT NULL,
    requestid integer,
    "HistoryOfPresentIllnessOrInjury" text,
    "MedicalHistory" text,
    "Medications" text,
    "Allergies" text,
    "Temp" text,
    "HR" text,
    "RR" text,
    "BloodPressureSystolic" text,
    "BloodPressureDiastolic" text,
    "O2" text,
    "Pain" text,
    "Heent" text,
    "CV" text,
    "Chest" text,
    "ABD" text,
    "Extremeties" text,
    "Skin" text,
    "Neuro" text,
    "Other" text,
    "Diagnosis" text,
    "TreatmentPlan" text,
    "MedicationsDispensed" text,
    "Procedures" text,
    "FollowUp" text,
    "AdminId" integer,
    "PhysicianId" integer,
    "IsFinalize" boolean DEFAULT false NOT NULL
);
 #   DROP TABLE public."EncounterForm";
       public         heap    postgres    false                       1259    57357 !   EncounterForm_EncounterFormId_seq    SEQUENCE     �   CREATE SEQUENCE public."EncounterForm_EncounterFormId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public."EncounterForm_EncounterFormId_seq";
       public          postgres    false    279            a           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public."EncounterForm_EncounterFormId_seq" OWNED BY public."EncounterForm"."EncounterFormId";
          public          postgres    false    278            �            1259    33017    admin    TABLE     �  CREATE TABLE public.admin (
    adminid integer NOT NULL,
    aspnetuserid character varying(128) NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    roleid integer
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    33016    admin_adminid_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_adminid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.admin_adminid_seq;
       public          postgres    false    229            b           0    0    admin_adminid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.admin_adminid_seq OWNED BY public.admin.adminid;
          public          postgres    false    228            �            1259    33032    adminregion    TABLE     �   CREATE TABLE public.adminregion (
    adminregionid integer NOT NULL,
    adminid integer NOT NULL,
    regionid integer NOT NULL
);
    DROP TABLE public.adminregion;
       public         heap    postgres    false            �            1259    33031    adminregion_adminregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.adminregion_adminregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.adminregion_adminregionid_seq;
       public          postgres    false    231            c           0    0    adminregion_adminregionid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.adminregion_adminregionid_seq OWNED BY public.adminregion.adminregionid;
          public          postgres    false    230            �            1259    32988    aspnetroles    TABLE     v   CREATE TABLE public.aspnetroles (
    id character varying(128) NOT NULL,
    name character varying(256) NOT NULL
);
    DROP TABLE public.aspnetroles;
       public         heap    postgres    false            �            1259    33048    aspnetuserroles    TABLE     �   CREATE TABLE public.aspnetuserroles (
    userid character varying(128) NOT NULL,
    roleid character varying(128) NOT NULL
);
 #   DROP TABLE public.aspnetuserroles;
       public         heap    postgres    false            �            1259    32993    aspnetusers    TABLE     i  CREATE TABLE public.aspnetusers (
    id character varying(128) NOT NULL,
    username character varying(256) NOT NULL,
    passwordhash character varying,
    email character varying(256),
    phonenumber character varying(20),
    ip character varying(20),
    createddate timestamp without time zone NOT NULL,
    modifieddate timestamp without time zone
);
    DROP TABLE public.aspnetusers;
       public         heap    postgres    false            �            1259    32914    blockrequests    TABLE     m  CREATE TABLE public.blockrequests (
    blockrequestid integer NOT NULL,
    phonenumber character varying(50),
    email character varying(50),
    isactive bit(1),
    reason character varying,
    requestid character varying(50) NOT NULL,
    ip character varying(20),
    createddate timestamp without time zone,
    modifieddate timestamp without time zone
);
 !   DROP TABLE public.blockrequests;
       public         heap    postgres    false            �            1259    32913     blockrequests_blockrequestid_seq    SEQUENCE     �   CREATE SEQUENCE public.blockrequests_blockrequestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.blockrequests_blockrequestid_seq;
       public          postgres    false    216            d           0    0     blockrequests_blockrequestid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.blockrequests_blockrequestid_seq OWNED BY public.blockrequests.blockrequestid;
          public          postgres    false    215            �            1259    33059    business    TABLE     n  CREATE TABLE public.business (
    businessid integer NOT NULL,
    name character varying(100) NOT NULL,
    address1 character varying(500),
    address2 character varying(500),
    city character varying(50),
    regionid integer,
    zipcode character varying(10),
    phonenumber character varying(20),
    faxnumber character varying(20),
    isregistered bit(1),
    createdby character varying(128),
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted bit(1),
    ip character varying(20)
);
    DROP TABLE public.business;
       public         heap    postgres    false            �            1259    33058    business_businessid_seq    SEQUENCE     �   CREATE SEQUENCE public.business_businessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.business_businessid_seq;
       public          postgres    false    234            e           0    0    business_businessid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.business_businessid_seq OWNED BY public.business.businessid;
          public          postgres    false    233            �            1259    32929    casetag    TABLE     i   CREATE TABLE public.casetag (
    casetagid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.casetag;
       public         heap    postgres    false            �            1259    33073 	   concierge    TABLE     �  CREATE TABLE public.concierge (
    conciergeid integer NOT NULL,
    conciergename character varying(100) NOT NULL,
    address character varying(150),
    street character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    zipcode character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    regionid integer,
    roleid character varying(20)
);
    DROP TABLE public.concierge;
       public         heap    postgres    false            �            1259    33072    concierge_conciergeid_seq    SEQUENCE     �   CREATE SEQUENCE public.concierge_conciergeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.concierge_conciergeid_seq;
       public          postgres    false    236            f           0    0    concierge_conciergeid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.concierge_conciergeid_seq OWNED BY public.concierge.conciergeid;
          public          postgres    false    235            �            1259    33000    emaillog    TABLE       CREATE TABLE public.emaillog (
    emaillogid numeric(9,0) NOT NULL,
    emailtemplate character varying,
    subjectname character varying(200) NOT NULL,
    emailid character varying(200) NOT NULL,
    confirmationnumber character varying(200),
    filepath character varying,
    roleid integer,
    requestid integer,
    adminid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    isemailsent bit(1),
    senttries integer,
    action integer
);
    DROP TABLE public.emaillog;
       public         heap    postgres    false            �            1259    33093    healthprofessionals    TABLE     i  CREATE TABLE public.healthprofessionals (
    vendorid integer NOT NULL,
    vendorname character varying(100) NOT NULL,
    profession integer,
    faxnumber character varying(50) NOT NULL,
    address character varying(150),
    city character varying(100),
    state character varying(50),
    zip character varying(50),
    regionid integer,
    createddate timestamp without time zone NOT NULL,
    modifieddate timestamp without time zone,
    phonenumber character varying(100),
    isdeleted bit(1),
    ip character varying(20),
    email character varying(50),
    businesscontact character varying(100)
);
 '   DROP TABLE public.healthprofessionals;
       public         heap    postgres    false            �            1259    33092     healthprofessionals_vendorid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionals_vendorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.healthprofessionals_vendorid_seq;
       public          postgres    false    240            g           0    0     healthprofessionals_vendorid_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.healthprofessionals_vendorid_seq OWNED BY public.healthprofessionals.vendorid;
          public          postgres    false    239            �            1259    33085    healthprofessionaltype    TABLE     �   CREATE TABLE public.healthprofessionaltype (
    healthprofessionalid integer NOT NULL,
    professionname character varying(50) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    isactive bit(1),
    isdeleted bit(1)
);
 *   DROP TABLE public.healthprofessionaltype;
       public         heap    postgres    false            �            1259    33084 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE     �   CREATE SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq;
       public          postgres    false    238            h           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.healthprofessionaltype_healthprofessionalid_seq OWNED BY public.healthprofessionaltype.healthprofessionalid;
          public          postgres    false    237            �            1259    33107    menu    TABLE     �   CREATE TABLE public.menu (
    menuid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    sortorder integer,
    CONSTRAINT menu_accounttype_check CHECK ((accounttype = ANY (ARRAY[1, 2])))
);
    DROP TABLE public.menu;
       public         heap    postgres    false            �            1259    33106    menu_menuid_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_menuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.menu_menuid_seq;
       public          postgres    false    242            i           0    0    menu_menuid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.menu_menuid_seq OWNED BY public.menu.menuid;
          public          postgres    false    241            �            1259    33008    orderdetails    TABLE     l  CREATE TABLE public.orderdetails (
    id integer NOT NULL,
    vendorid integer,
    requestid integer,
    faxnumber character varying(50),
    email character varying(50),
    businesscontact character varying(100),
    prescription character varying,
    noofrefill integer,
    createddate timestamp without time zone,
    createdby character varying(100)
);
     DROP TABLE public.orderdetails;
       public         heap    postgres    false            �            1259    33007    orderdetails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orderdetails_id_seq;
       public          postgres    false    227            j           0    0    orderdetails_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orderdetails_id_seq OWNED BY public.orderdetails.id;
          public          postgres    false    226            �            1259    33115 	   physician    TABLE     �  CREATE TABLE public.physician (
    physicianid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    medicallicense character varying(500),
    photo character varying(100),
    adminnotes character varying(500),
    isagreementdoc bit(1),
    isbackgrounddoc bit(1),
    istrainingdoc bit(1),
    isnondisclosuredoc bit(1),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    regionid integer,
    zip character varying(10),
    altphone character varying(20),
    createdby character varying(500) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(500),
    modifieddate timestamp without time zone,
    status smallint,
    businessname character varying(100) NOT NULL,
    businesswebsite character varying(200) NOT NULL,
    isdeleted bit(1),
    roleid integer,
    npinumber character varying(500),
    islicensedoc bit(1),
    signature character varying(100),
    iscredentialdoc bit(1),
    istokengenerate bit(1),
    syncemailaddress character varying(50)
);
    DROP TABLE public.physician;
       public         heap    postgres    false            �            1259    33114    physician_physicianid_seq    SEQUENCE     �   CREATE SEQUENCE public.physician_physicianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.physician_physicianid_seq;
       public          postgres    false    244            k           0    0    physician_physicianid_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.physician_physicianid_seq OWNED BY public.physician.physicianid;
          public          postgres    false    243            �            1259    33128    physicianlocation    TABLE       CREATE TABLE public.physicianlocation (
    locationid integer NOT NULL,
    physicianid integer,
    latitude numeric(9,2),
    longitude numeric(9,2),
    createddate timestamp without time zone,
    physicianname character varying(50),
    address character varying(500)
);
 %   DROP TABLE public.physicianlocation;
       public         heap    postgres    false            �            1259    33139    physiciannotification    TABLE     �   CREATE TABLE public.physiciannotification (
    id integer NOT NULL,
    physicianid integer,
    isnotificationstopped bit(1)
);
 )   DROP TABLE public.physiciannotification;
       public         heap    postgres    false            �            1259    33138    physiciannotification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physiciannotification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.physiciannotification_id_seq;
       public          postgres    false    247            l           0    0    physiciannotification_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.physiciannotification_id_seq OWNED BY public.physiciannotification.id;
          public          postgres    false    246            �            1259    33151    physicianregion    TABLE        CREATE TABLE public.physicianregion (
    physicianregionid integer NOT NULL,
    physicianid integer,
    regionid integer
);
 #   DROP TABLE public.physicianregion;
       public         heap    postgres    false            �            1259    33150 %   physicianregion_physicianregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.physicianregion_physicianregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.physicianregion_physicianregionid_seq;
       public          postgres    false    249            m           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.physicianregion_physicianregionid_seq OWNED BY public.physicianregion.physicianregionid;
          public          postgres    false    248            �            1259    32974    region    TABLE     �   CREATE TABLE public.region (
    regionid integer NOT NULL,
    name character varying(50) NOT NULL,
    abbreviation character varying(50)
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    32973    region_regionid_seq    SEQUENCE     �   CREATE SEQUENCE public.region_regionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.region_regionid_seq;
       public          postgres    false    220            n           0    0    region_regionid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.region_regionid_seq OWNED BY public.region.regionid;
          public          postgres    false    219                       1259    33259    request    TABLE     �  CREATE TABLE public.request (
    requestid integer NOT NULL,
    requesttypeid integer DEFAULT 1 NOT NULL,
    userid integer,
    firstname character varying(100),
    lastname character varying(100),
    phonenumber character varying(23),
    email character varying(50),
    status smallint NOT NULL,
    physicianid integer,
    confirmationnumber character varying(20),
    createddate date NOT NULL,
    isdeleted bit(1),
    modifieddate timestamp without time zone,
    declinedby character varying(250),
    isurgentemailsent bit(1),
    lastwellnessdate timestamp without time zone,
    ismobile bit(1),
    calltype smallint,
    completedbyphysician bit(1),
    lastreservationdate timestamp without time zone,
    accepteddate timestamp without time zone,
    relationname character varying(100),
    casenumber character varying(50),
    ip character varying(20),
    casetag character varying(50),
    casetagphysician character varying(50),
    patientaccountid character varying(128),
    createduserid integer,
    CONSTRAINT request_requesttypeid_check CHECK ((requesttypeid = ANY (ARRAY[1, 2, 3, 4]))),
    CONSTRAINT request_status_check CHECK (((status >= 1) AND (status <= 15)))
);
    DROP TABLE public.request;
       public         heap    postgres    false                       1259    33258    request_requestid_seq    SEQUENCE     �   CREATE SEQUENCE public.request_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.request_requestid_seq;
       public          postgres    false    263            o           0    0    request_requestid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.request_requestid_seq OWNED BY public.request.requestid;
          public          postgres    false    262            	           1259    33280    requestbusiness    TABLE     �   CREATE TABLE public.requestbusiness (
    requestbusinessid integer NOT NULL,
    requestid integer NOT NULL,
    businessid integer NOT NULL,
    ip character varying(20)
);
 #   DROP TABLE public.requestbusiness;
       public         heap    postgres    false                       1259    33279 %   requestbusiness_requestbusinessid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestbusiness_requestbusinessid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestbusiness_requestbusinessid_seq;
       public          postgres    false    265            p           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestbusiness_requestbusinessid_seq OWNED BY public.requestbusiness.requestbusinessid;
          public          postgres    false    264                       1259    33297    requestclient    TABLE     �  CREATE TABLE public.requestclient (
    requestclientid integer NOT NULL,
    requestid integer NOT NULL,
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    phonenumber character varying(23),
    location character varying(100),
    address character varying(500),
    regionid integer,
    notimobile character varying(20),
    notiemail character varying(50),
    notes character varying(500),
    email character varying(50),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    ismobile bit(1),
    street character varying(100),
    city character varying(100),
    state character varying(100),
    zipcode character varying(10),
    communicationtype smallint,
    remindreservationcount smallint,
    remindhousecallcount smallint,
    issetfollowupsent smallint,
    ip character varying(20),
    isreservationremindersent smallint,
    latitude numeric(9,2),
    longitude numeric(9,2)
);
 !   DROP TABLE public.requestclient;
       public         heap    postgres    false            
           1259    33296 !   requestclient_requestclientid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclient_requestclientid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclient_requestclientid_seq;
       public          postgres    false    267            q           0    0 !   requestclient_requestclientid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclient_requestclientid_seq OWNED BY public.requestclient.requestclientid;
          public          postgres    false    266                       1259    33401    requestclosed    TABLE        CREATE TABLE public.requestclosed (
    requestclosedid integer NOT NULL,
    requestid integer NOT NULL,
    requeststatuslogid integer NOT NULL,
    phynotes character varying(500),
    clientnotes character varying(500),
    ip character varying(20)
);
 !   DROP TABLE public.requestclosed;
       public         heap    postgres    false                       1259    33400 !   requestclosed_requestclosedid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestclosed_requestclosedid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.requestclosed_requestclosedid_seq;
       public          postgres    false    277            r           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.requestclosed_requestclosedid_seq OWNED BY public.requestclosed.requestclosedid;
          public          postgres    false    276                       1259    33316    requestconcierge    TABLE     �   CREATE TABLE public.requestconcierge (
    id integer NOT NULL,
    requestid integer NOT NULL,
    conciergeid integer NOT NULL,
    ip character varying(20)
);
 $   DROP TABLE public.requestconcierge;
       public         heap    postgres    false                       1259    33315    requestconcierge_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requestconcierge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.requestconcierge_id_seq;
       public          postgres    false    269            s           0    0    requestconcierge_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.requestconcierge_id_seq OWNED BY public.requestconcierge.id;
          public          postgres    false    268                       1259    33333    requestnotes    TABLE       CREATE TABLE public.requestnotes (
    requestnotesid integer NOT NULL,
    requestid integer NOT NULL,
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    physiciannotes character varying(500),
    adminnotes character varying(500),
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    ip character varying(20),
    administrativenotes character varying(500)
);
     DROP TABLE public.requestnotes;
       public         heap    postgres    false                       1259    33332    requestnotes_requestnotesid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestnotes_requestnotesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.requestnotes_requestnotesid_seq;
       public          postgres    false    271            t           0    0    requestnotes_requestnotesid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.requestnotes_requestnotesid_seq OWNED BY public.requestnotes.requestnotesid;
          public          postgres    false    270                       1259    33347    requeststatuslog    TABLE     m  CREATE TABLE public.requeststatuslog (
    requeststatuslogid integer NOT NULL,
    requestid integer NOT NULL,
    status smallint NOT NULL,
    physicianid integer,
    adminid integer,
    transtophysicianid integer,
    notes character varying(500),
    createddate timestamp without time zone NOT NULL,
    ip character varying(20),
    transtoadmin bit(1)
);
 $   DROP TABLE public.requeststatuslog;
       public         heap    postgres    false                       1259    33346 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE     �   CREATE SEQUENCE public.requeststatuslog_requeststatuslogid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.requeststatuslog_requeststatuslogid_seq;
       public          postgres    false    273            u           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.requeststatuslog_requeststatuslogid_seq OWNED BY public.requeststatuslog.requeststatuslogid;
          public          postgres    false    272            �            1259    32981    requesttype    TABLE     q   CREATE TABLE public.requesttype (
    requesttypeid integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.requesttype;
       public         heap    postgres    false            �            1259    32980    requesttype_requesttypeid_seq    SEQUENCE     �   CREATE SEQUENCE public.requesttype_requesttypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.requesttype_requesttypeid_seq;
       public          postgres    false    222            v           0    0    requesttype_requesttypeid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.requesttype_requesttypeid_seq OWNED BY public.requesttype.requesttypeid;
          public          postgres    false    221                       1259    33376    requestwisefile    TABLE     
  CREATE TABLE public.requestwisefile (
    requestwisefileid integer NOT NULL,
    requestid integer NOT NULL,
    filename character varying(500) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    physicianid integer,
    adminid integer,
    doctype smallint,
    isfrontside bit(1),
    iscompensation bit(1),
    ip character varying(20),
    isfinalize bit(1),
    isdeleted bit(1),
    ispatientrecords bit(1),
    CONSTRAINT requestwisefile_doctype_check CHECK ((doctype = ANY (ARRAY[1, 2, 3])))
);
 #   DROP TABLE public.requestwisefile;
       public         heap    postgres    false                       1259    33375 %   requestwisefile_requestwisefileid_seq    SEQUENCE     �   CREATE SEQUENCE public.requestwisefile_requestwisefileid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.requestwisefile_requestwisefileid_seq;
       public          postgres    false    275            w           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.requestwisefile_requestwisefileid_seq OWNED BY public.requestwisefile.requestwisefileid;
          public          postgres    false    274            �            1259    33168    role    TABLE     �  CREATE TABLE public.role (
    roleid integer NOT NULL,
    name character varying(50) NOT NULL,
    accounttype smallint NOT NULL,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    isdeleted bit(1) NOT NULL,
    ip character varying(20),
    CONSTRAINT role_accounttype_check CHECK ((accounttype = ANY (ARRAY[1, 2])))
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    33167    role_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.role_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.role_roleid_seq;
       public          postgres    false    251            x           0    0    role_roleid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.role_roleid_seq OWNED BY public.role.roleid;
          public          postgres    false    250            �            1259    33176    rolemenu    TABLE     j   CREATE TABLE public.rolemenu (
    rolemenuid integer NOT NULL,
    roleid integer,
    menuid integer
);
    DROP TABLE public.rolemenu;
       public         heap    postgres    false            �            1259    33175    rolemenu_rolemenuid_seq    SEQUENCE     �   CREATE SEQUENCE public.rolemenu_rolemenuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.rolemenu_rolemenuid_seq;
       public          postgres    false    253            y           0    0    rolemenu_rolemenuid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.rolemenu_rolemenuid_seq OWNED BY public.rolemenu.rolemenuid;
          public          postgres    false    252            �            1259    33193    shift    TABLE     O  CREATE TABLE public.shift (
    shiftid integer NOT NULL,
    physicianid integer NOT NULL,
    startdate date NOT NULL,
    isrepeat bit(1) NOT NULL,
    weekdays character(7),
    repeatupto integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    ip character varying(20)
);
    DROP TABLE public.shift;
       public         heap    postgres    false            �            1259    33192    shift_shiftid_seq    SEQUENCE     �   CREATE SEQUENCE public.shift_shiftid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.shift_shiftid_seq;
       public          postgres    false    255            z           0    0    shift_shiftid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.shift_shiftid_seq OWNED BY public.shift.shiftid;
          public          postgres    false    254                       1259    33210    shiftdetail    TABLE       CREATE TABLE public.shiftdetail (
    shiftdetailid integer NOT NULL,
    shiftid integer NOT NULL,
    shiftdate timestamp without time zone NOT NULL,
    regionid integer,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL,
    status smallint NOT NULL,
    isdeleted bit(1) NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    lastrunningdate timestamp without time zone,
    eventid character varying(100),
    issync bit(1)
);
    DROP TABLE public.shiftdetail;
       public         heap    postgres    false                        1259    33209    shiftdetail_shiftdetailid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetail_shiftdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.shiftdetail_shiftdetailid_seq;
       public          postgres    false    257            {           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.shiftdetail_shiftdetailid_seq OWNED BY public.shiftdetail.shiftdetailid;
          public          postgres    false    256                       1259    33227    shiftdetailregion    TABLE     �   CREATE TABLE public.shiftdetailregion (
    shiftdetailregionid integer NOT NULL,
    shiftdetailid integer NOT NULL,
    regionid integer NOT NULL,
    isdeleted boolean
);
 %   DROP TABLE public.shiftdetailregion;
       public         heap    postgres    false                       1259    33226 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE     �   CREATE SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq;
       public          postgres    false    259            |           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.shiftdetailregion_shiftdetailregionid_seq OWNED BY public.shiftdetailregion.shiftdetailregionid;
          public          postgres    false    258            �            1259    32932    smslog    TABLE     �  CREATE TABLE public.smslog (
    smslogid numeric(9,2) NOT NULL,
    smstemplate character varying,
    mobilenumber character varying(50),
    confirmationnumber character varying(200),
    roleid integer,
    adminid integer,
    requestid integer,
    physicianid integer,
    createdate timestamp without time zone NOT NULL,
    sentdate timestamp without time zone,
    issmssent boolean,
    senttries integer NOT NULL,
    action integer
);
    DROP TABLE public.smslog;
       public         heap    postgres    false                       1259    33244    users    TABLE     +  CREATE TABLE public.users (
    userid integer NOT NULL,
    aspnetuserid character varying(128),
    firstname character varying(100) NOT NULL,
    lastname character varying(100),
    email character varying(50) NOT NULL,
    mobile character varying(20),
    ismobile boolean,
    street character varying(100),
    city character varying(100),
    state character varying(100),
    regionid integer,
    zipcode character varying(10),
    strmonth character varying(20),
    intyear integer,
    intdate integer,
    createdby character varying(128) NOT NULL,
    createddate timestamp without time zone NOT NULL,
    modifiedby character varying(128),
    modifieddate timestamp without time zone,
    status smallint,
    isdeleted boolean,
    ip character varying(20),
    isrequestwithemail boolean
);
    DROP TABLE public.users;
       public         heap    postgres    false                       1259    33243    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    261            }           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    260                       2604    57361    EncounterForm EncounterFormId    DEFAULT     �   ALTER TABLE ONLY public."EncounterForm" ALTER COLUMN "EncounterFormId" SET DEFAULT nextval('public."EncounterForm_EncounterFormId_seq"'::regclass);
 P   ALTER TABLE public."EncounterForm" ALTER COLUMN "EncounterFormId" DROP DEFAULT;
       public          postgres    false    279    278    279            �           2604    33020    admin adminid    DEFAULT     n   ALTER TABLE ONLY public.admin ALTER COLUMN adminid SET DEFAULT nextval('public.admin_adminid_seq'::regclass);
 <   ALTER TABLE public.admin ALTER COLUMN adminid DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    33035    adminregion adminregionid    DEFAULT     �   ALTER TABLE ONLY public.adminregion ALTER COLUMN adminregionid SET DEFAULT nextval('public.adminregion_adminregionid_seq'::regclass);
 H   ALTER TABLE public.adminregion ALTER COLUMN adminregionid DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    32917    blockrequests blockrequestid    DEFAULT     �   ALTER TABLE ONLY public.blockrequests ALTER COLUMN blockrequestid SET DEFAULT nextval('public.blockrequests_blockrequestid_seq'::regclass);
 K   ALTER TABLE public.blockrequests ALTER COLUMN blockrequestid DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    33062    business businessid    DEFAULT     z   ALTER TABLE ONLY public.business ALTER COLUMN businessid SET DEFAULT nextval('public.business_businessid_seq'::regclass);
 B   ALTER TABLE public.business ALTER COLUMN businessid DROP DEFAULT;
       public          postgres    false    234    233    234                        2604    33076    concierge conciergeid    DEFAULT     ~   ALTER TABLE ONLY public.concierge ALTER COLUMN conciergeid SET DEFAULT nextval('public.concierge_conciergeid_seq'::regclass);
 D   ALTER TABLE public.concierge ALTER COLUMN conciergeid DROP DEFAULT;
       public          postgres    false    236    235    236                       2604    33096    healthprofessionals vendorid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionals ALTER COLUMN vendorid SET DEFAULT nextval('public.healthprofessionals_vendorid_seq'::regclass);
 K   ALTER TABLE public.healthprofessionals ALTER COLUMN vendorid DROP DEFAULT;
       public          postgres    false    239    240    240                       2604    33088 +   healthprofessionaltype healthprofessionalid    DEFAULT     �   ALTER TABLE ONLY public.healthprofessionaltype ALTER COLUMN healthprofessionalid SET DEFAULT nextval('public.healthprofessionaltype_healthprofessionalid_seq'::regclass);
 Z   ALTER TABLE public.healthprofessionaltype ALTER COLUMN healthprofessionalid DROP DEFAULT;
       public          postgres    false    238    237    238                       2604    33110    menu menuid    DEFAULT     j   ALTER TABLE ONLY public.menu ALTER COLUMN menuid SET DEFAULT nextval('public.menu_menuid_seq'::regclass);
 :   ALTER TABLE public.menu ALTER COLUMN menuid DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    33011    orderdetails id    DEFAULT     r   ALTER TABLE ONLY public.orderdetails ALTER COLUMN id SET DEFAULT nextval('public.orderdetails_id_seq'::regclass);
 >   ALTER TABLE public.orderdetails ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227                       2604    33118    physician physicianid    DEFAULT     ~   ALTER TABLE ONLY public.physician ALTER COLUMN physicianid SET DEFAULT nextval('public.physician_physicianid_seq'::regclass);
 D   ALTER TABLE public.physician ALTER COLUMN physicianid DROP DEFAULT;
       public          postgres    false    244    243    244                       2604    33142    physiciannotification id    DEFAULT     �   ALTER TABLE ONLY public.physiciannotification ALTER COLUMN id SET DEFAULT nextval('public.physiciannotification_id_seq'::regclass);
 G   ALTER TABLE public.physiciannotification ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247                       2604    33154 !   physicianregion physicianregionid    DEFAULT     �   ALTER TABLE ONLY public.physicianregion ALTER COLUMN physicianregionid SET DEFAULT nextval('public.physicianregion_physicianregionid_seq'::regclass);
 P   ALTER TABLE public.physicianregion ALTER COLUMN physicianregionid DROP DEFAULT;
       public          postgres    false    248    249    249            �           2604    32977    region regionid    DEFAULT     r   ALTER TABLE ONLY public.region ALTER COLUMN regionid SET DEFAULT nextval('public.region_regionid_seq'::regclass);
 >   ALTER TABLE public.region ALTER COLUMN regionid DROP DEFAULT;
       public          postgres    false    220    219    220                       2604    33262    request requestid    DEFAULT     v   ALTER TABLE ONLY public.request ALTER COLUMN requestid SET DEFAULT nextval('public.request_requestid_seq'::regclass);
 @   ALTER TABLE public.request ALTER COLUMN requestid DROP DEFAULT;
       public          postgres    false    263    262    263                       2604    33283 !   requestbusiness requestbusinessid    DEFAULT     �   ALTER TABLE ONLY public.requestbusiness ALTER COLUMN requestbusinessid SET DEFAULT nextval('public.requestbusiness_requestbusinessid_seq'::regclass);
 P   ALTER TABLE public.requestbusiness ALTER COLUMN requestbusinessid DROP DEFAULT;
       public          postgres    false    264    265    265                       2604    33300    requestclient requestclientid    DEFAULT     �   ALTER TABLE ONLY public.requestclient ALTER COLUMN requestclientid SET DEFAULT nextval('public.requestclient_requestclientid_seq'::regclass);
 L   ALTER TABLE public.requestclient ALTER COLUMN requestclientid DROP DEFAULT;
       public          postgres    false    266    267    267                       2604    33404    requestclosed requestclosedid    DEFAULT     �   ALTER TABLE ONLY public.requestclosed ALTER COLUMN requestclosedid SET DEFAULT nextval('public.requestclosed_requestclosedid_seq'::regclass);
 L   ALTER TABLE public.requestclosed ALTER COLUMN requestclosedid DROP DEFAULT;
       public          postgres    false    277    276    277                       2604    33319    requestconcierge id    DEFAULT     z   ALTER TABLE ONLY public.requestconcierge ALTER COLUMN id SET DEFAULT nextval('public.requestconcierge_id_seq'::regclass);
 B   ALTER TABLE public.requestconcierge ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    269    269                       2604    33336    requestnotes requestnotesid    DEFAULT     �   ALTER TABLE ONLY public.requestnotes ALTER COLUMN requestnotesid SET DEFAULT nextval('public.requestnotes_requestnotesid_seq'::regclass);
 J   ALTER TABLE public.requestnotes ALTER COLUMN requestnotesid DROP DEFAULT;
       public          postgres    false    270    271    271                       2604    33350 #   requeststatuslog requeststatuslogid    DEFAULT     �   ALTER TABLE ONLY public.requeststatuslog ALTER COLUMN requeststatuslogid SET DEFAULT nextval('public.requeststatuslog_requeststatuslogid_seq'::regclass);
 R   ALTER TABLE public.requeststatuslog ALTER COLUMN requeststatuslogid DROP DEFAULT;
       public          postgres    false    273    272    273            �           2604    32984    requesttype requesttypeid    DEFAULT     �   ALTER TABLE ONLY public.requesttype ALTER COLUMN requesttypeid SET DEFAULT nextval('public.requesttype_requesttypeid_seq'::regclass);
 H   ALTER TABLE public.requesttype ALTER COLUMN requesttypeid DROP DEFAULT;
       public          postgres    false    221    222    222                       2604    33379 !   requestwisefile requestwisefileid    DEFAULT     �   ALTER TABLE ONLY public.requestwisefile ALTER COLUMN requestwisefileid SET DEFAULT nextval('public.requestwisefile_requestwisefileid_seq'::regclass);
 P   ALTER TABLE public.requestwisefile ALTER COLUMN requestwisefileid DROP DEFAULT;
       public          postgres    false    274    275    275                       2604    33171    role roleid    DEFAULT     j   ALTER TABLE ONLY public.role ALTER COLUMN roleid SET DEFAULT nextval('public.role_roleid_seq'::regclass);
 :   ALTER TABLE public.role ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    250    251    251                       2604    33179    rolemenu rolemenuid    DEFAULT     z   ALTER TABLE ONLY public.rolemenu ALTER COLUMN rolemenuid SET DEFAULT nextval('public.rolemenu_rolemenuid_seq'::regclass);
 B   ALTER TABLE public.rolemenu ALTER COLUMN rolemenuid DROP DEFAULT;
       public          postgres    false    252    253    253            	           2604    33196    shift shiftid    DEFAULT     n   ALTER TABLE ONLY public.shift ALTER COLUMN shiftid SET DEFAULT nextval('public.shift_shiftid_seq'::regclass);
 <   ALTER TABLE public.shift ALTER COLUMN shiftid DROP DEFAULT;
       public          postgres    false    255    254    255            
           2604    33213    shiftdetail shiftdetailid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetail ALTER COLUMN shiftdetailid SET DEFAULT nextval('public.shiftdetail_shiftdetailid_seq'::regclass);
 H   ALTER TABLE public.shiftdetail ALTER COLUMN shiftdetailid DROP DEFAULT;
       public          postgres    false    256    257    257                       2604    33230 %   shiftdetailregion shiftdetailregionid    DEFAULT     �   ALTER TABLE ONLY public.shiftdetailregion ALTER COLUMN shiftdetailregionid SET DEFAULT nextval('public.shiftdetailregion_shiftdetailregionid_seq'::regclass);
 T   ALTER TABLE public.shiftdetailregion ALTER COLUMN shiftdetailregionid DROP DEFAULT;
       public          postgres    false    259    258    259                       2604    33247    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    261    260    261            Z          0    57358    EncounterForm 
   TABLE DATA           �  COPY public."EncounterForm" ("EncounterFormId", requestid, "HistoryOfPresentIllnessOrInjury", "MedicalHistory", "Medications", "Allergies", "Temp", "HR", "RR", "BloodPressureSystolic", "BloodPressureDiastolic", "O2", "Pain", "Heent", "CV", "Chest", "ABD", "Extremeties", "Skin", "Neuro", "Other", "Diagnosis", "TreatmentPlan", "MedicationsDispensed", "Procedures", "FollowUp", "AdminId", "PhysicianId", "IsFinalize") FROM stdin;
    public          postgres    false    279   �|      (          0    33017    admin 
   TABLE DATA           �   COPY public.admin (adminid, aspnetuserid, firstname, lastname, email, mobile, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, isdeleted, roleid) FROM stdin;
    public          postgres    false    229   �|      *          0    33032    adminregion 
   TABLE DATA           G   COPY public.adminregion (adminregionid, adminid, regionid) FROM stdin;
    public          postgres    false    231   }      "          0    32988    aspnetroles 
   TABLE DATA           /   COPY public.aspnetroles (id, name) FROM stdin;
    public          postgres    false    223   *}      +          0    33048    aspnetuserroles 
   TABLE DATA           9   COPY public.aspnetuserroles (userid, roleid) FROM stdin;
    public          postgres    false    232   Y}      #          0    32993    aspnetusers 
   TABLE DATA           t   COPY public.aspnetusers (id, username, passwordhash, email, phonenumber, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    224   �}                0    32914    blockrequests 
   TABLE DATA           �   COPY public.blockrequests (blockrequestid, phonenumber, email, isactive, reason, requestid, ip, createddate, modifieddate) FROM stdin;
    public          postgres    false    216   a      -          0    33059    business 
   TABLE DATA           �   COPY public.business (businessid, name, address1, address2, city, regionid, zipcode, phonenumber, faxnumber, isregistered, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip) FROM stdin;
    public          postgres    false    234   ~                0    32929    casetag 
   TABLE DATA           2   COPY public.casetag (casetagid, name) FROM stdin;
    public          postgres    false    217   �      /          0    33073 	   concierge 
   TABLE DATA           �   COPY public.concierge (conciergeid, conciergename, address, street, city, state, zipcode, createddate, regionid, roleid) FROM stdin;
    public          postgres    false    236   3�      $          0    33000    emaillog 
   TABLE DATA           �   COPY public.emaillog (emaillogid, emailtemplate, subjectname, emailid, confirmationnumber, filepath, roleid, requestid, adminid, physicianid, createdate, sentdate, isemailsent, senttries, action) FROM stdin;
    public          postgres    false    225   P�      3          0    33093    healthprofessionals 
   TABLE DATA           �   COPY public.healthprofessionals (vendorid, vendorname, profession, faxnumber, address, city, state, zip, regionid, createddate, modifieddate, phonenumber, isdeleted, ip, email, businesscontact) FROM stdin;
    public          postgres    false    240   m�      1          0    33085    healthprofessionaltype 
   TABLE DATA           x   COPY public.healthprofessionaltype (healthprofessionalid, professionname, createddate, isactive, isdeleted) FROM stdin;
    public          postgres    false    238   �      5          0    33107    menu 
   TABLE DATA           D   COPY public.menu (menuid, name, accounttype, sortorder) FROM stdin;
    public          postgres    false    242   d�      &          0    33008    orderdetails 
   TABLE DATA           �   COPY public.orderdetails (id, vendorid, requestid, faxnumber, email, businesscontact, prescription, noofrefill, createddate, createdby) FROM stdin;
    public          postgres    false    227   ��      7          0    33115 	   physician 
   TABLE DATA           �  COPY public.physician (physicianid, aspnetuserid, firstname, lastname, email, mobile, medicallicense, photo, adminnotes, isagreementdoc, isbackgrounddoc, istrainingdoc, isnondisclosuredoc, address1, address2, city, regionid, zip, altphone, createdby, createddate, modifiedby, modifieddate, status, businessname, businesswebsite, isdeleted, roleid, npinumber, islicensedoc, signature, iscredentialdoc, istokengenerate, syncemailaddress) FROM stdin;
    public          postgres    false    244   �      8          0    33128    physicianlocation 
   TABLE DATA           ~   COPY public.physicianlocation (locationid, physicianid, latitude, longitude, createddate, physicianname, address) FROM stdin;
    public          postgres    false    245   �      :          0    33139    physiciannotification 
   TABLE DATA           W   COPY public.physiciannotification (id, physicianid, isnotificationstopped) FROM stdin;
    public          postgres    false    247   0�      <          0    33151    physicianregion 
   TABLE DATA           S   COPY public.physicianregion (physicianregionid, physicianid, regionid) FROM stdin;
    public          postgres    false    249   M�                0    32974    region 
   TABLE DATA           >   COPY public.region (regionid, name, abbreviation) FROM stdin;
    public          postgres    false    220   }�      J          0    33259    request 
   TABLE DATA           �  COPY public.request (requestid, requesttypeid, userid, firstname, lastname, phonenumber, email, status, physicianid, confirmationnumber, createddate, isdeleted, modifieddate, declinedby, isurgentemailsent, lastwellnessdate, ismobile, calltype, completedbyphysician, lastreservationdate, accepteddate, relationname, casenumber, ip, casetag, casetagphysician, patientaccountid, createduserid) FROM stdin;
    public          postgres    false    263   ݃      L          0    33280    requestbusiness 
   TABLE DATA           W   COPY public.requestbusiness (requestbusinessid, requestid, businessid, ip) FROM stdin;
    public          postgres    false    265   w�      N          0    33297    requestclient 
   TABLE DATA           s  COPY public.requestclient (requestclientid, requestid, firstname, lastname, phonenumber, location, address, regionid, notimobile, notiemail, notes, email, strmonth, intyear, intdate, ismobile, street, city, state, zipcode, communicationtype, remindreservationcount, remindhousecallcount, issetfollowupsent, ip, isreservationremindersent, latitude, longitude) FROM stdin;
    public          postgres    false    267   ��      X          0    33401    requestclosed 
   TABLE DATA           r   COPY public.requestclosed (requestclosedid, requestid, requeststatuslogid, phynotes, clientnotes, ip) FROM stdin;
    public          postgres    false    277   ��      P          0    33316    requestconcierge 
   TABLE DATA           J   COPY public.requestconcierge (id, requestid, conciergeid, ip) FROM stdin;
    public          postgres    false    269   ��      R          0    33333    requestnotes 
   TABLE DATA           �   COPY public.requestnotes (requestnotesid, requestid, strmonth, intyear, intdate, physiciannotes, adminnotes, createdby, createddate, modifiedby, modifieddate, ip, administrativenotes) FROM stdin;
    public          postgres    false    271   Ǉ      T          0    33347    requeststatuslog 
   TABLE DATA           �   COPY public.requeststatuslog (requeststatuslogid, requestid, status, physicianid, adminid, transtophysicianid, notes, createddate, ip, transtoadmin) FROM stdin;
    public          postgres    false    273   e�      !          0    32981    requesttype 
   TABLE DATA           :   COPY public.requesttype (requesttypeid, name) FROM stdin;
    public          postgres    false    222   M�      V          0    33376    requestwisefile 
   TABLE DATA           �   COPY public.requestwisefile (requestwisefileid, requestid, filename, createddate, physicianid, adminid, doctype, isfrontside, iscompensation, ip, isfinalize, isdeleted, ispatientrecords) FROM stdin;
    public          postgres    false    275   j�      >          0    33168    role 
   TABLE DATA           z   COPY public.role (roleid, name, accounttype, createdby, createddate, modifiedby, modifieddate, isdeleted, ip) FROM stdin;
    public          postgres    false    251   r�      @          0    33176    rolemenu 
   TABLE DATA           >   COPY public.rolemenu (rolemenuid, roleid, menuid) FROM stdin;
    public          postgres    false    253   ��      B          0    33193    shift 
   TABLE DATA           |   COPY public.shift (shiftid, physicianid, startdate, isrepeat, weekdays, repeatupto, createdby, createddate, ip) FROM stdin;
    public          postgres    false    255   ��      D          0    33210    shiftdetail 
   TABLE DATA           �   COPY public.shiftdetail (shiftdetailid, shiftid, shiftdate, regionid, starttime, endtime, status, isdeleted, modifiedby, modifieddate, lastrunningdate, eventid, issync) FROM stdin;
    public          postgres    false    257   Ɍ      F          0    33227    shiftdetailregion 
   TABLE DATA           d   COPY public.shiftdetailregion (shiftdetailregionid, shiftdetailid, regionid, isdeleted) FROM stdin;
    public          postgres    false    259   �                0    32932    smslog 
   TABLE DATA           �   COPY public.smslog (smslogid, smstemplate, mobilenumber, confirmationnumber, roleid, adminid, requestid, physicianid, createdate, sentdate, issmssent, senttries, action) FROM stdin;
    public          postgres    false    218   �      H          0    33244    users 
   TABLE DATA             COPY public.users (userid, aspnetuserid, firstname, lastname, email, mobile, ismobile, street, city, state, regionid, zipcode, strmonth, intyear, intdate, createdby, createddate, modifiedby, modifieddate, status, isdeleted, ip, isrequestwithemail) FROM stdin;
    public          postgres    false    261    �      ~           0    0 !   EncounterForm_EncounterFormId_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."EncounterForm_EncounterFormId_seq"', 3, true);
          public          postgres    false    278                       0    0    admin_adminid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_adminid_seq', 1, false);
          public          postgres    false    228            �           0    0    adminregion_adminregionid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.adminregion_adminregionid_seq', 1, false);
          public          postgres    false    230            �           0    0     blockrequests_blockrequestid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.blockrequests_blockrequestid_seq', 1, true);
          public          postgres    false    215            �           0    0    business_businessid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.business_businessid_seq', 1, false);
          public          postgres    false    233            �           0    0    concierge_conciergeid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.concierge_conciergeid_seq', 1, false);
          public          postgres    false    235            �           0    0     healthprofessionals_vendorid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.healthprofessionals_vendorid_seq', 3, true);
          public          postgres    false    239            �           0    0 /   healthprofessionaltype_healthprofessionalid_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.healthprofessionaltype_healthprofessionalid_seq', 2, true);
          public          postgres    false    237            �           0    0    menu_menuid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.menu_menuid_seq', 1, false);
          public          postgres    false    241            �           0    0    orderdetails_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orderdetails_id_seq', 2, true);
          public          postgres    false    226            �           0    0    physician_physicianid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.physician_physicianid_seq', 1, true);
          public          postgres    false    243            �           0    0    physiciannotification_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.physiciannotification_id_seq', 1, false);
          public          postgres    false    246            �           0    0 %   physicianregion_physicianregionid_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.physicianregion_physicianregionid_seq', 4, true);
          public          postgres    false    248            �           0    0    region_regionid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.region_regionid_seq', 1, true);
          public          postgres    false    219            �           0    0    request_requestid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.request_requestid_seq', 89, true);
          public          postgres    false    262            �           0    0 %   requestbusiness_requestbusinessid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.requestbusiness_requestbusinessid_seq', 1, false);
          public          postgres    false    264            �           0    0 !   requestclient_requestclientid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.requestclient_requestclientid_seq', 83, true);
          public          postgres    false    266            �           0    0 !   requestclosed_requestclosedid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.requestclosed_requestclosedid_seq', 5, true);
          public          postgres    false    276            �           0    0    requestconcierge_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.requestconcierge_id_seq', 1, false);
          public          postgres    false    268            �           0    0    requestnotes_requestnotesid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.requestnotes_requestnotesid_seq', 7, true);
          public          postgres    false    270            �           0    0 '   requeststatuslog_requeststatuslogid_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.requeststatuslog_requeststatuslogid_seq', 23, true);
          public          postgres    false    272            �           0    0    requesttype_requesttypeid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.requesttype_requesttypeid_seq', 1, false);
          public          postgres    false    221            �           0    0 %   requestwisefile_requestwisefileid_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.requestwisefile_requestwisefileid_seq', 49, true);
          public          postgres    false    274            �           0    0    role_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.role_roleid_seq', 1, false);
          public          postgres    false    250            �           0    0    rolemenu_rolemenuid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.rolemenu_rolemenuid_seq', 1, false);
          public          postgres    false    252            �           0    0    shift_shiftid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shift_shiftid_seq', 1, false);
          public          postgres    false    254            �           0    0    shiftdetail_shiftdetailid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.shiftdetail_shiftdetailid_seq', 1, false);
          public          postgres    false    256            �           0    0 )   shiftdetailregion_shiftdetailregionid_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.shiftdetailregion_shiftdetailregionid_seq', 1, false);
          public          postgres    false    258            �           0    0    users_userid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_userid_seq', 19, true);
          public          postgres    false    260            `           2606    57366     EncounterForm EncounterForm_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_pkey" PRIMARY KEY ("EncounterFormId");
 N   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_pkey";
       public            postgres    false    279            .           2606    33024    admin admin_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (adminid);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    229            0           2606    33037    adminregion adminregion_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_pkey PRIMARY KEY (adminregionid);
 F   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_pkey;
       public            postgres    false    231            &           2606    32992    aspnetroles aspnetroles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetroles
    ADD CONSTRAINT aspnetroles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetroles DROP CONSTRAINT aspnetroles_pkey;
       public            postgres    false    223            2           2606    33052 $   aspnetuserroles aspnetuserroles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_pkey PRIMARY KEY (userid, roleid);
 N   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_pkey;
       public            postgres    false    232    232            (           2606    32999    aspnetusers aspnetusers_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.aspnetusers
    ADD CONSTRAINT aspnetusers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.aspnetusers DROP CONSTRAINT aspnetusers_pkey;
       public            postgres    false    224                       2606    32921     blockrequests blockrequests_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.blockrequests
    ADD CONSTRAINT blockrequests_pkey PRIMARY KEY (blockrequestid);
 J   ALTER TABLE ONLY public.blockrequests DROP CONSTRAINT blockrequests_pkey;
       public            postgres    false    216            4           2606    33066    business business_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_pkey PRIMARY KEY (businessid);
 @   ALTER TABLE ONLY public.business DROP CONSTRAINT business_pkey;
       public            postgres    false    234            6           2606    33078    concierge concierge_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_pkey PRIMARY KEY (conciergeid);
 B   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_pkey;
       public            postgres    false    236            *           2606    33006    emaillog emaillog_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.emaillog
    ADD CONSTRAINT emaillog_pkey PRIMARY KEY (emaillogid);
 @   ALTER TABLE ONLY public.emaillog DROP CONSTRAINT emaillog_pkey;
       public            postgres    false    225            :           2606    33100 ,   healthprofessionals healthprofessionals_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_pkey PRIMARY KEY (vendorid);
 V   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_pkey;
       public            postgres    false    240            8           2606    33090 2   healthprofessionaltype healthprofessionaltype_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionaltype
    ADD CONSTRAINT healthprofessionaltype_pkey PRIMARY KEY (healthprofessionalid);
 \   ALTER TABLE ONLY public.healthprofessionaltype DROP CONSTRAINT healthprofessionaltype_pkey;
       public            postgres    false    238            <           2606    33113    menu menu_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menuid);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    242            ,           2606    33015    orderdetails orderdetails_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.orderdetails DROP CONSTRAINT orderdetails_pkey;
       public            postgres    false    227            >           2606    33122    physician physician_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_pkey PRIMARY KEY (physicianid);
 B   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_pkey;
       public            postgres    false    244            @           2606    33144 0   physiciannotification physiciannotification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_pkey;
       public            postgres    false    247            B           2606    33156 $   physicianregion physicianregion_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_pkey PRIMARY KEY (physicianregionid);
 N   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_pkey;
       public            postgres    false    249            "           2606    32979    region region_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    220            P           2606    33268    request request_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (requestid);
 >   ALTER TABLE ONLY public.request DROP CONSTRAINT request_pkey;
       public            postgres    false    263            R           2606    33285 $   requestbusiness requestbusiness_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_pkey PRIMARY KEY (requestbusinessid);
 N   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_pkey;
       public            postgres    false    265            T           2606    33304     requestclient requestclient_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_pkey PRIMARY KEY (requestclientid);
 J   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_pkey;
       public            postgres    false    267            ^           2606    33408     requestclosed requestclosed_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_pkey PRIMARY KEY (requestclosedid);
 J   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_pkey;
       public            postgres    false    277            V           2606    33321 &   requestconcierge requestconcierge_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_pkey;
       public            postgres    false    269            X           2606    33340    requestnotes requestnotes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_pkey PRIMARY KEY (requestnotesid);
 H   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_pkey;
       public            postgres    false    271            Z           2606    33354 &   requeststatuslog requeststatuslog_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_pkey PRIMARY KEY (requeststatuslogid);
 P   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_pkey;
       public            postgres    false    273            $           2606    32986    requesttype requesttype_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.requesttype
    ADD CONSTRAINT requesttype_pkey PRIMARY KEY (requesttypeid);
 F   ALTER TABLE ONLY public.requesttype DROP CONSTRAINT requesttype_pkey;
       public            postgres    false    222            \           2606    33384 $   requestwisefile requestwisefile_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_pkey PRIMARY KEY (requestwisefileid);
 N   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_pkey;
       public            postgres    false    275            D           2606    33174    role role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (roleid);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    251            F           2606    33181    rolemenu rolemenu_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_pkey PRIMARY KEY (rolemenuid);
 @   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_pkey;
       public            postgres    false    253            H           2606    33198    shift shift_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_pkey PRIMARY KEY (shiftid);
 :   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_pkey;
       public            postgres    false    255            J           2606    33215    shiftdetail shiftdetail_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_pkey PRIMARY KEY (shiftdetailid);
 F   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_pkey;
       public            postgres    false    257            L           2606    33232 (   shiftdetailregion shiftdetailregion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_pkey PRIMARY KEY (shiftdetailregionid);
 R   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_pkey;
       public            postgres    false    259                        2606    32938    smslog smslog_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.smslog
    ADD CONSTRAINT smslog_pkey PRIMARY KEY (smslogid);
 <   ALTER TABLE ONLY public.smslog DROP CONSTRAINT smslog_pkey;
       public            postgres    false    218            N           2606    33251    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    261            �           2606    57372 (   EncounterForm EncounterForm_AdminId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_AdminId_fkey" FOREIGN KEY ("AdminId") REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_AdminId_fkey";
       public          postgres    false    4910    229    279            �           2606    57377 ,   EncounterForm EncounterForm_PhysicianId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_PhysicianId_fkey" FOREIGN KEY ("PhysicianId") REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_PhysicianId_fkey";
       public          postgres    false    279    4926    244            �           2606    57367 *   EncounterForm EncounterForm_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."EncounterForm"
    ADD CONSTRAINT "EncounterForm_requestid_fkey" FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public."EncounterForm" DROP CONSTRAINT "EncounterForm_requestid_fkey";
       public          postgres    false    279    4944    263            a           2606    33025    admin admin_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 G   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_aspnetuserid_fkey;
       public          postgres    false    229    4904    224            b           2606    33038 $   adminregion adminregion_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 N   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_adminid_fkey;
       public          postgres    false    231    229    4910            c           2606    33043 %   adminregion adminregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adminregion
    ADD CONSTRAINT adminregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 O   ALTER TABLE ONLY public.adminregion DROP CONSTRAINT adminregion_regionid_fkey;
       public          postgres    false    220    4898    231            d           2606    33053 +   aspnetuserroles aspnetuserroles_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aspnetuserroles
    ADD CONSTRAINT aspnetuserroles_userid_fkey FOREIGN KEY (userid) REFERENCES public.aspnetusers(id);
 U   ALTER TABLE ONLY public.aspnetuserroles DROP CONSTRAINT aspnetuserroles_userid_fkey;
       public          postgres    false    224    4904    232            e           2606    33067    business business_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.business
    ADD CONSTRAINT business_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 I   ALTER TABLE ONLY public.business DROP CONSTRAINT business_regionid_fkey;
       public          postgres    false    220    234    4898            f           2606    33079 !   concierge concierge_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.concierge
    ADD CONSTRAINT concierge_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 K   ALTER TABLE ONLY public.concierge DROP CONSTRAINT concierge_regionid_fkey;
       public          postgres    false    4898    220    236            g           2606    33101 7   healthprofessionals healthprofessionals_profession_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.healthprofessionals
    ADD CONSTRAINT healthprofessionals_profession_fkey FOREIGN KEY (profession) REFERENCES public.healthprofessionaltype(healthprofessionalid);
 a   ALTER TABLE ONLY public.healthprofessionals DROP CONSTRAINT healthprofessionals_profession_fkey;
       public          postgres    false    240    238    4920            h           2606    33123 %   physician physician_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physician
    ADD CONSTRAINT physician_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 O   ALTER TABLE ONLY public.physician DROP CONSTRAINT physician_aspnetuserid_fkey;
       public          postgres    false    224    4904    244            i           2606    33133 4   physicianlocation physicianlocation_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianlocation
    ADD CONSTRAINT physicianlocation_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 ^   ALTER TABLE ONLY public.physicianlocation DROP CONSTRAINT physicianlocation_physicianid_fkey;
       public          postgres    false    245    4926    244            j           2606    33145 <   physiciannotification physiciannotification_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physiciannotification
    ADD CONSTRAINT physiciannotification_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 f   ALTER TABLE ONLY public.physiciannotification DROP CONSTRAINT physiciannotification_physicianid_fkey;
       public          postgres    false    247    244    4926            k           2606    33157 0   physicianregion physicianregion_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_physicianid_fkey;
       public          postgres    false    249    244    4926            l           2606    33162 -   physicianregion physicianregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.physicianregion
    ADD CONSTRAINT physicianregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 W   ALTER TABLE ONLY public.physicianregion DROP CONSTRAINT physicianregion_regionid_fkey;
       public          postgres    false    220    249    4898            v           2606    33274     request request_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 J   ALTER TABLE ONLY public.request DROP CONSTRAINT request_physicianid_fkey;
       public          postgres    false    244    263    4926            w           2606    33269    request request_userid_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);
 E   ALTER TABLE ONLY public.request DROP CONSTRAINT request_userid_fkey;
       public          postgres    false    4942    263    261            x           2606    33291 /   requestbusiness requestbusiness_businessid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_businessid_fkey FOREIGN KEY (businessid) REFERENCES public.business(businessid);
 Y   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_businessid_fkey;
       public          postgres    false    4916    265    234            y           2606    33286 .   requestbusiness requestbusiness_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestbusiness
    ADD CONSTRAINT requestbusiness_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestbusiness DROP CONSTRAINT requestbusiness_requestid_fkey;
       public          postgres    false    4944    263    265            z           2606    33310 )   requestclient requestclient_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 S   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_regionid_fkey;
       public          postgres    false    267    220    4898            {           2606    33305 *   requestclient requestclient_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclient
    ADD CONSTRAINT requestclient_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclient DROP CONSTRAINT requestclient_requestid_fkey;
       public          postgres    false    263    267    4944            �           2606    33409 *   requestclosed requestclosed_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 T   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requestid_fkey;
       public          postgres    false    277    263    4944            �           2606    33414 3   requestclosed requestclosed_requeststatuslogid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestclosed
    ADD CONSTRAINT requestclosed_requeststatuslogid_fkey FOREIGN KEY (requeststatuslogid) REFERENCES public.requeststatuslog(requeststatuslogid);
 ]   ALTER TABLE ONLY public.requestclosed DROP CONSTRAINT requestclosed_requeststatuslogid_fkey;
       public          postgres    false    4954    273    277            |           2606    33327 2   requestconcierge requestconcierge_conciergeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_conciergeid_fkey FOREIGN KEY (conciergeid) REFERENCES public.concierge(conciergeid);
 \   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_conciergeid_fkey;
       public          postgres    false    269    4918    236            }           2606    33322 0   requestconcierge requestconcierge_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestconcierge
    ADD CONSTRAINT requestconcierge_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requestconcierge DROP CONSTRAINT requestconcierge_requestid_fkey;
       public          postgres    false    4944    263    269            ~           2606    33341 (   requestnotes requestnotes_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestnotes
    ADD CONSTRAINT requestnotes_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 R   ALTER TABLE ONLY public.requestnotes DROP CONSTRAINT requestnotes_requestid_fkey;
       public          postgres    false    271    4944    263                       2606    33365 .   requeststatuslog requeststatuslog_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 X   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_adminid_fkey;
       public          postgres    false    229    4910    273            �           2606    33360 2   requeststatuslog requeststatuslog_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 \   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_physicianid_fkey;
       public          postgres    false    4926    244    273            �           2606    33355 0   requeststatuslog requeststatuslog_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 Z   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_requestid_fkey;
       public          postgres    false    4944    263    273            �           2606    33370 9   requeststatuslog requeststatuslog_transtophysicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requeststatuslog
    ADD CONSTRAINT requeststatuslog_transtophysicianid_fkey FOREIGN KEY (transtophysicianid) REFERENCES public.physician(physicianid);
 c   ALTER TABLE ONLY public.requeststatuslog DROP CONSTRAINT requeststatuslog_transtophysicianid_fkey;
       public          postgres    false    4926    273    244            �           2606    33395 ,   requestwisefile requestwisefile_adminid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_adminid_fkey FOREIGN KEY (adminid) REFERENCES public.admin(adminid);
 V   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_adminid_fkey;
       public          postgres    false    275    229    4910            �           2606    33390 0   requestwisefile requestwisefile_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 Z   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_physicianid_fkey;
       public          postgres    false    275    4926    244            �           2606    33385 .   requestwisefile requestwisefile_requestid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.requestwisefile
    ADD CONSTRAINT requestwisefile_requestid_fkey FOREIGN KEY (requestid) REFERENCES public.request(requestid);
 X   ALTER TABLE ONLY public.requestwisefile DROP CONSTRAINT requestwisefile_requestid_fkey;
       public          postgres    false    263    4944    275            m           2606    33187    rolemenu rolemenu_menuid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_menuid_fkey FOREIGN KEY (menuid) REFERENCES public.menu(menuid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_menuid_fkey;
       public          postgres    false    253    4924    242            n           2606    33182    rolemenu rolemenu_roleid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rolemenu
    ADD CONSTRAINT rolemenu_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.role(roleid);
 G   ALTER TABLE ONLY public.rolemenu DROP CONSTRAINT rolemenu_roleid_fkey;
       public          postgres    false    4932    253    251            o           2606    33204    shift shift_createdby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_createdby_fkey FOREIGN KEY (createdby) REFERENCES public.aspnetusers(id);
 D   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_createdby_fkey;
       public          postgres    false    255    224    4904            p           2606    33199    shift shift_physicianid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shift
    ADD CONSTRAINT shift_physicianid_fkey FOREIGN KEY (physicianid) REFERENCES public.physician(physicianid);
 F   ALTER TABLE ONLY public.shift DROP CONSTRAINT shift_physicianid_fkey;
       public          postgres    false    4926    244    255            q           2606    33221 '   shiftdetail shiftdetail_modifiedby_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_modifiedby_fkey FOREIGN KEY (modifiedby) REFERENCES public.aspnetusers(id);
 Q   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_modifiedby_fkey;
       public          postgres    false    4904    224    257            r           2606    33216 $   shiftdetail shiftdetail_shiftid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetail
    ADD CONSTRAINT shiftdetail_shiftid_fkey FOREIGN KEY (shiftid) REFERENCES public.shift(shiftid);
 N   ALTER TABLE ONLY public.shiftdetail DROP CONSTRAINT shiftdetail_shiftid_fkey;
       public          postgres    false    4936    257    255            s           2606    33238 1   shiftdetailregion shiftdetailregion_regionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.region(regionid);
 [   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_regionid_fkey;
       public          postgres    false    4898    259    220            t           2606    33233 6   shiftdetailregion shiftdetailregion_shiftdetailid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.shiftdetailregion
    ADD CONSTRAINT shiftdetailregion_shiftdetailid_fkey FOREIGN KEY (shiftdetailid) REFERENCES public.shiftdetail(shiftdetailid);
 `   ALTER TABLE ONLY public.shiftdetailregion DROP CONSTRAINT shiftdetailregion_shiftdetailid_fkey;
       public          postgres    false    4938    257    259            u           2606    33252    users users_aspnetuserid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_aspnetuserid_fkey FOREIGN KEY (aspnetuserid) REFERENCES public.aspnetusers(id);
 G   ALTER TABLE ONLY public.users DROP CONSTRAINT users_aspnetuserid_fkey;
       public          postgres    false    261    4904    224            Z   O   x�3�0�L)N�b�?* #�4.cN;%htZ:�r�ҁ֤�4�i)�Y�Bt�@zS�P��g	W� U90s      (      x������ � �      *      x������ � �      "      x�3�tL����2�H,�L�+����� L�      +   a   x�ʹ1�x���	q��Ī��gYO�flv��dd�@�[q�^��H	���	�����&�9��3�F7�0�Z	i!��)��������1~3�X      #   �  x���I�1E��S�,P�V>AN�%�IO���8�O�m�@ A�OI��S�aw�17Fp�
\4QRmM�t��O_�����S>>���i
����i�H4=|��	��A�y�)�V��\	�1��	������$9�`ӷ�����������+�ADp�܀�d�Y��u4�ك6�dr�$E!hY3b�������·_���k����$�+����%��b)�ű6Rn�#�ͱ8dY����:����x�PdQc�w����M�����aK���M7���W���%�(7�0�0Ό�>���Ւ �*���Իd�R�DN����w��ä�ڂa�d��жH��"�i��)����� o�kT������m���y����>ׁ            x������ � �      -      x������ � �         �   x�-��
1 ��W�D�y����֫���R�MIR�����a�مIpf�R]p��Q�?������f�d؇A�q4k�0kJe�?9�[s��w�w���Lp�}G�U�j"g��n?�a�Ȫ����SI�z������/�/6q      /      x������ � �      $      x������ � �      3   �   x�}�M
�0�דSx%�Ob��۞�MhT�@��׈�vSxo���CX��O����[�����4[�5�.��AuC���sM�����SP� �ŰX#�:t?��=�l�V�J��J0�X�avm������{�F�j��?������ aRu��� �#>t      1   7   x�3�,(�OK-.���3�4202�50�50W00�#NC�?.#$eF����qqq z9Q      5      x������ � �      &   u   x��̻�0 ��<E��}|9����a!#9�Ҧ� �!0��Y�D8J�{��6�/?�KT�(ǜ�Җv	
$C�!�o�I8�y�&F0>����w���=5�zE2��9z���l*&      7   �   x�}�Mn� ���Sp,�v���$��&�J�*=}��Ķ<EB�i`�̧����gO�i8\4/���0�ק�3 YC�5;��G�)�Y�΃C��]MTh��R�R�ә����KH	��1�P?�;��W��@^.�2�D�[Zr��.��E�\��T(����E�(f5�������k|׋������M��60$U#�.ec�p�Z�V���L��cy˯p5ӓ�?�A�m,�C�-�CBE�����yY�      8      x������ � �      :      x������ � �      <       x�3�4�4�2�B.cN �2�B�=... 4�w         P   x�3��K-W��/����2��,J���L��2��M,��I�K����2�t�,.)�L.Q�OSp��)�M�sq����� x      J   �  x���]O�0����
/�b������"J�����C�!,*�zߵ� ,]�u��s�i��n<Y>�Љ��)\�����a��Y���8�VF�h�#��N�[%�0�;���A�,t���xZ/��5�_��J��+��#�߻�q�fԌ���$���d��Jڃ2�~��;�݈�5d����x�NW���@� ����֩=���][fǄd�ua\)H%ʞ�]��:&A$�L��^���O�)INRI_�6*�8��b⹍�Qw&���&
�G���F�w�*H
�PFI��1�$�L��a�����0���E2>o��f��o!vY�BZ�N�����N�ܧ'��/@�0��UY#\Dk�:B��m���ZT������y�'΄}      L      x������ � �      N   �  x��S�n�0���B�]�)Q�:UNҤHZ7�H=�g(��볔x�N,��;�3�$��l纁_�(;HS�
A����թc�+0[Ʃ�M�\�=4�a@h��{���u�hxp]O����1@Ow$X=�f��鸜��*p����(fI�Cq*��;u���Ήh'8�*�w�Y:9((��)p2/@���XD�i���R�q�a��n��;�����T��HZU�sF�S���L8t�	=q�_V�
�E�_9�_�%�RZ���i
�e���9�W��"�@��]���m����%�Ƣ�*�Yo�����6���z���(վ

B�G�[�F�E�鳛���i�mmS:��`��"u�g?xA@p�O��%���`O�m8X��A�V�c'4˛i�i���g�Xw����@�0�1�O��p�?č��,�t�s+9B�E��|8��k/      X      x�3�0�42�� �=... .:�      P      x������ � �      R   �   x�u�A
� е���1��!r7Ҵd�Ղnz�*�)����?���yOY)�-����L!����S��N{UO����h��i�����-M���R�c�5�,�<63����B�R�
�t}���MY�ڍv� ,N�����U9      T   �   x�]�Kr�0D��)t�4Y�Cp6.G"�v*��U�}�{����v�n��)��qX�@���0(��L$��Y�H����ӧ��[�'uN��f*�V��z����ڀ���8�L� `��kܩZ;�X�!/�4���u��iȊ�<�F ��h�W����jN�����"�G
�=[��HE����-�q�Ⱦ1[-���OU5      !      x������ � �      V   �  x���݊�F�����T��]]ݭ��B �H�L���N4���I^?%'��W!]�9U竒��Ȼk�[h5X �� A�����!�H���Gϑ���z�9��K���Hd�ef�}x��^?�}^5=�$�Y(�5 [2H�iʵD�n�t��t$3<���yh�|,��}y���y�w6�hi�l��g޲�V�8,	�8 *�Y��s+2!��c�FO#:\Br6Ȯ6Xz��yH�vM�g(�.S(�r?�^l����׺yt�xN>E�v�	W�&K$����A�p���K*�VL�P��k���|��z9���;�8�5�%�4���(�|i�j�緃8w;�jt&��Vn�w)�P�5p���"�[��5��0�k?����(�0 �.���GG_q�o'i��$
�R�Qg%�(i*�ɞ�߬��ֆ��}Y���gm�\;��}`�)Vq���\�JQ��CɽC,1fIUؖU�%3��Ե����܇�y~\�cc���6�y�.B�`bY�� �u�{�#�&� �r:����epf�c�B���A�oT��JϏ}�~x�o߾�''��6�q�A�HͱE�A���]��Wj�w͒�*���A����]ȴ%W��&/I7K+�:��Y��M:����n��߇*�=��)�pU�.����[��SP���U��ړ������
���e��I�/�1_�'y9i\˻˹ί���dM�~k��f���f����� ���S���ʊ����Mԓ	A��D�����U�E      >      x������ � �      @      x������ � �      B      x������ � �      D      x������ � �      F      x������ � �            x������ � �      H   �  x�e�Mr�0���)|j��W��h��@��(��HvR��%-Ok;3���$��#2X��D�c�U�r��O>�Т���~�L�I?�x�f{�a�t��̬�Xx�� �O����z>�;0�-;@�1�!�=�)�)m�qk��jB��\�B��q^����%�|�%���S��^�[��i��m�gad��s�T'V�I�����*����:n�7t��W@�g4]��+��ΘYT�V�R0)Yh��y�����
�w��S�����0��A
��9Ucq�<C��h�A�v9�$��)���֊�D��͝���K�%�)��m��!�bSm���׿�c�1�ߍ��/�W�����7N]��45m]P�)�D�g��'�|B��"m��M�J\���ab+�-��M����������uz�`z�i���i�/�,��s\��H�Ҽ����_��j���ԛ     
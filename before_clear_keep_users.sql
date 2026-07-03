--
-- PostgreSQL database dump
--

\restrict zAo7iY1mOhkBV94ZPbwjqQQMU9uJfiQewrdqTz3b67oRf6MuJjlxWtEzXtb1MrT

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: application_clearances; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.application_clearances (
    id bigint NOT NULL,
    land_transfer_application_id bigint NOT NULL,
    clearance_number character varying(255) NOT NULL,
    decision_status character varying(50) NOT NULL,
    application_code character varying(255) NOT NULL,
    transferor_name character varying(255) NOT NULL,
    transferee_name character varying(255) NOT NULL,
    municipality character varying(255),
    barangay character varying(255),
    total_area_hectares numeric(12,4) DEFAULT 0.0000 NOT NULL,
    parcel_snapshot json NOT NULL,
    review_officer_name character varying(255) NOT NULL,
    reviewed_at timestamp(0) without time zone,
    generated_by bigint NOT NULL,
    generated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.application_clearances OWNER TO dar_admin;

--
-- Name: application_clearances_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.application_clearances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.application_clearances_id_seq OWNER TO dar_admin;

--
-- Name: application_clearances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.application_clearances_id_seq OWNED BY public.application_clearances.id;


--
-- Name: application_documents; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.application_documents (
    id bigint NOT NULL,
    land_transfer_application_id bigint NOT NULL,
    required_document_id bigint NOT NULL,
    original_filename character varying(255),
    file_path character varying(255) NOT NULL,
    annex_reference character varying(255),
    uploaded_by bigint NOT NULL,
    remarks text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    document_reference_number character varying(255),
    document_metadata jsonb,
    metadata_encoded_by bigint,
    metadata_encoded_at timestamp(0) without time zone,
    source_record_id bigint,
    source_record_package_id bigint
);


ALTER TABLE public.application_documents OWNER TO dar_admin;

--
-- Name: application_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.application_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.application_documents_id_seq OWNER TO dar_admin;

--
-- Name: application_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.application_documents_id_seq OWNED BY public.application_documents.id;


--
-- Name: application_parcels; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.application_parcels (
    id bigint NOT NULL,
    land_transfer_application_id bigint NOT NULL,
    parcel_id bigint,
    area_hectares numeric(12,4),
    parcel_code character varying(255),
    title_no character varying(255),
    tax_decl_no character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    lot_number character varying(255),
    survey_plan_number character varying(255),
    title_type character varying(20),
    rod_office character varying(255),
    area_square_meters numeric(14,2),
    CONSTRAINT application_parcels_area_positive_chk CHECK ((area_hectares > (0)::numeric))
);


ALTER TABLE public.application_parcels OWNER TO dar_admin;

--
-- Name: application_parcels_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.application_parcels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.application_parcels_id_seq OWNER TO dar_admin;

--
-- Name: application_parcels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.application_parcels_id_seq OWNED BY public.application_parcels.id;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    actor_user_id bigint,
    land_transfer_application_id bigint,
    auditable_type character varying(255),
    auditable_id bigint,
    action character varying(100) NOT NULL,
    metadata json,
    ip_address character varying(100),
    user_agent text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audit_logs OWNER TO dar_admin;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_logs_id_seq OWNER TO dar_admin;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO dar_admin;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO dar_admin;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO dar_admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO dar_admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO dar_admin;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO dar_admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO dar_admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: land_transfer_applications; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.land_transfer_applications (
    id bigint NOT NULL,
    application_code character varying(255) NOT NULL,
    transferor_name character varying(255) NOT NULL,
    transferee_name character varying(255) NOT NULL,
    municipality character varying(255),
    barangay character varying(255),
    date_filed date,
    date_of_transfer date,
    status character varying(30) DEFAULT 'draft'::character varying NOT NULL,
    remarks text,
    encoded_by bigint NOT NULL,
    reviewed_by bigint,
    reviewed_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    transferee_landowner_id bigint,
    decision_notes text,
    decision_reason character varying(255),
    validated_at timestamp(0) without time zone,
    validation_snapshot json,
    transferor_landowner_id bigint,
    registry_mutated_at timestamp(0) without time zone,
    registry_mutated_by bigint,
    applicant_name character varying(255),
    applicant_type character varying(50),
    authorized_representative_name character varying(255),
    has_special_power_of_attorney boolean DEFAULT false CONSTRAINT land_transfer_applications_has_special_power_of_attorn_not_null NOT NULL,
    or_number character varying(100),
    or_date date,
    amount_paid numeric(12,2),
    date_of_application date,
    transfer_nature character varying(255),
    is_succession_case boolean DEFAULT false NOT NULL,
    retention_certificate_required boolean DEFAULT false CONSTRAINT land_transfer_applications_retention_certificate_requi_not_null NOT NULL,
    retention_certificate_reference character varying(255),
    landholding_review_notes text,
    ltc_form4_subject_land_findings json,
    ltc_form4_recommendation_findings json,
    ltc_form4_recommendation_decision character varying(30),
    ltc_form4_other_findings text,
    ltc_form4_certified_at date,
    ltc_form4_certifying_officer_name character varying(255)
);


ALTER TABLE public.land_transfer_applications OWNER TO dar_admin;

--
-- Name: land_transfer_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.land_transfer_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.land_transfer_applications_id_seq OWNER TO dar_admin;

--
-- Name: land_transfer_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.land_transfer_applications_id_seq OWNED BY public.land_transfer_applications.id;


--
-- Name: landholding_mutations; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.landholding_mutations (
    id bigint NOT NULL,
    land_transfer_application_id bigint NOT NULL,
    parcel_id bigint NOT NULL,
    transferor_landowner_id bigint NOT NULL,
    transferee_landowner_id bigint NOT NULL,
    transferred_area_hectares numeric(12,4) NOT NULL,
    transferor_before_area numeric(12,4),
    transferor_after_area numeric(12,4),
    transferee_before_area numeric(12,4),
    transferee_after_area numeric(12,4),
    mutated_by bigint,
    mutated_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT landholding_mutations_transferred_positive_chk CHECK ((transferred_area_hectares > (0)::numeric))
);


ALTER TABLE public.landholding_mutations OWNER TO dar_admin;

--
-- Name: landholding_mutations_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.landholding_mutations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.landholding_mutations_id_seq OWNER TO dar_admin;

--
-- Name: landholding_mutations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.landholding_mutations_id_seq OWNED BY public.landholding_mutations.id;


--
-- Name: landholdings; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.landholdings (
    id bigint NOT NULL,
    landowner_id bigint NOT NULL,
    parcel_id bigint NOT NULL,
    area_hectares numeric(12,4) NOT NULL,
    status character varying(30) DEFAULT 'active'::character varying NOT NULL,
    date_acquired date,
    date_transferred date,
    source_application_id bigint,
    remarks text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    source_reference_number character varying(255),
    reference_photo_path character varying(255),
    CONSTRAINT landholdings_area_nonnegative_chk CHECK ((area_hectares >= (0)::numeric))
);


ALTER TABLE public.landholdings OWNER TO dar_admin;

--
-- Name: landholdings_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.landholdings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.landholdings_id_seq OWNER TO dar_admin;

--
-- Name: landholdings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.landholdings_id_seq OWNED BY public.landholdings.id;


--
-- Name: landowners; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.landowners (
    id bigint NOT NULL,
    first_name character varying(255) NOT NULL,
    middle_name character varying(255),
    last_name character varying(255) NOT NULL,
    suffix character varying(255),
    contact_number character varying(255),
    address_line character varying(255),
    barangay character varying(255),
    municipality character varying(255),
    province character varying(255) DEFAULT 'Negros Oriental'::character varying NOT NULL,
    user_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    registered_owner_status character varying(255),
    spouse_name character varying(255)
);


ALTER TABLE public.landowners OWNER TO dar_admin;

--
-- Name: landowners_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.landowners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.landowners_id_seq OWNER TO dar_admin;

--
-- Name: landowners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.landowners_id_seq OWNED BY public.landowners.id;


--
-- Name: legacy_record_import_batches; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.legacy_record_import_batches (
    id bigint NOT NULL,
    record_type character varying(255) NOT NULL,
    original_filename character varying(255),
    status character varying(255) DEFAULT 'previewed'::character varying NOT NULL,
    total_rows integer DEFAULT 0 NOT NULL,
    valid_rows integer DEFAULT 0 NOT NULL,
    error_rows integer DEFAULT 0 NOT NULL,
    duplicate_rows integer DEFAULT 0 NOT NULL,
    committed_rows integer DEFAULT 0 NOT NULL,
    uploaded_by_user_id bigint,
    committed_by_user_id bigint,
    committed_at timestamp(0) without time zone,
    summary json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.legacy_record_import_batches OWNER TO dar_admin;

--
-- Name: legacy_record_import_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.legacy_record_import_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.legacy_record_import_batches_id_seq OWNER TO dar_admin;

--
-- Name: legacy_record_import_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.legacy_record_import_batches_id_seq OWNED BY public.legacy_record_import_batches.id;


--
-- Name: legacy_records; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.legacy_records (
    id bigint NOT NULL,
    record_type character varying(255) NOT NULL,
    origin character varying(255) DEFAULT 'migrated'::character varying NOT NULL,
    legacy_record_import_batch_id bigint,
    encoded_by_user_id bigint,
    title_number character varying(255),
    control_number character varying(255),
    tax_declaration_number character varying(255),
    lot_number character varying(255),
    survey_number character varying(255),
    landowner_name character varying(255),
    transferor_name character varying(255),
    transferee_name character varying(255),
    area_hectares numeric(12,4),
    crop_or_land_use character varying(255),
    barangay character varying(255),
    municipality character varying(255),
    province character varying(255) DEFAULT 'Negros Oriental'::character varying NOT NULL,
    record_date date,
    decision_status character varying(255),
    previous_dar_reference_number character varying(255),
    remarks text,
    source_book character varying(255) NOT NULL,
    page_number character varying(255),
    transcribed_by character varying(255) NOT NULL,
    transcription_date date NOT NULL,
    source_notes text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    parcel_id bigint,
    source_record_scope character varying(255) DEFAULT 'current_active'::character varying NOT NULL,
    parcel_code character varying(255),
    source_geometry_geojson text,
    landholding_reference_number character varying(255),
    application_reference_number character varying(255),
    boundary_description text,
    source_record_package_id bigint,
    landowner_id bigint
);


ALTER TABLE public.legacy_records OWNER TO dar_admin;

--
-- Name: legacy_records_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.legacy_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.legacy_records_id_seq OWNER TO dar_admin;

--
-- Name: legacy_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.legacy_records_id_seq OWNED BY public.legacy_records.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO dar_admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO dar_admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: parcels; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.parcels (
    id bigint NOT NULL,
    parcel_code character varying(255) NOT NULL,
    title_no character varying(255),
    tax_decl_no character varying(255),
    municipality character varying(255),
    barangay character varying(255),
    province character varying(255) DEFAULT 'Negros Oriental'::character varying NOT NULL,
    area_hectares numeric(12,4),
    geometry_geojson text,
    status character varying(30) DEFAULT 'active'::character varying NOT NULL,
    remarks text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    agricultural_status character varying(50) DEFAULT 'not_yet_determined'::character varying NOT NULL,
    reference_photo_path character varying(255),
    lot_number character varying(255),
    survey_plan_number character varying(255),
    title_type character varying(20),
    rod_office character varying(255),
    area_square_meters numeric(14,2)
);


ALTER TABLE public.parcels OWNER TO dar_admin;

--
-- Name: parcels_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.parcels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.parcels_id_seq OWNER TO dar_admin;

--
-- Name: parcels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.parcels_id_seq OWNED BY public.parcels.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO dar_admin;

--
-- Name: required_documents; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.required_documents (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    applies_to character varying(255) NOT NULL,
    is_mandatory boolean DEFAULT true NOT NULL,
    legal_basis character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    requirement_classification character varying(40) DEFAULT 'mandatory'::character varying NOT NULL,
    blocks_acceptance boolean DEFAULT true NOT NULL,
    classification_notes text,
    CONSTRAINT required_documents_applies_to_check CHECK (((applies_to)::text = ANY ((ARRAY['transferor'::character varying, 'transferee'::character varying])::text[])))
);


ALTER TABLE public.required_documents OWNER TO dar_admin;

--
-- Name: required_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.required_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.required_documents_id_seq OWNER TO dar_admin;

--
-- Name: required_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.required_documents_id_seq OWNED BY public.required_documents.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO dar_admin;

--
-- Name: source_record_package_import_batches; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.source_record_package_import_batches (
    id bigint NOT NULL,
    original_filename character varying(255),
    status character varying(255) DEFAULT 'previewed'::character varying NOT NULL,
    total_rows integer DEFAULT 0 NOT NULL,
    valid_rows integer DEFAULT 0 NOT NULL,
    error_rows integer DEFAULT 0 NOT NULL,
    duplicate_rows integer DEFAULT 0 NOT NULL,
    committed_rows integer DEFAULT 0 NOT NULL,
    uploaded_by_user_id bigint,
    committed_by_user_id bigint,
    committed_at timestamp(0) without time zone,
    preview_rows json NOT NULL,
    summary json,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.source_record_package_import_batches OWNER TO dar_admin;

--
-- Name: source_record_package_import_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.source_record_package_import_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.source_record_package_import_batches_id_seq OWNER TO dar_admin;

--
-- Name: source_record_package_import_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.source_record_package_import_batches_id_seq OWNED BY public.source_record_package_import_batches.id;


--
-- Name: source_record_packages; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.source_record_packages (
    id bigint NOT NULL,
    package_code character varying(255) NOT NULL,
    status character varying(255) DEFAULT 'encoded'::character varying NOT NULL,
    source_record_scope character varying(255) DEFAULT 'current_active'::character varying NOT NULL,
    parcel_id bigint,
    encoded_by_user_id bigint,
    parcel_code character varying(255),
    title_number character varying(255),
    landholding_reference_number character varying(255),
    control_number character varying(255),
    landowner_name character varying(255),
    transferor_name character varying(255),
    transferee_name character varying(255),
    lot_number character varying(255),
    survey_number character varying(255),
    area_hectares numeric(12,4),
    crop_or_land_use character varying(255),
    barangay character varying(255),
    municipality character varying(255),
    province character varying(255) DEFAULT 'Negros Oriental'::character varying NOT NULL,
    source_geometry_geojson text,
    boundary_description text,
    source_book character varying(255) NOT NULL,
    page_number character varying(255),
    transcribed_by character varying(255) NOT NULL,
    transcription_date date NOT NULL,
    source_notes text,
    remarks text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    landowner_id bigint,
    source_file_path character varying(255),
    source_file_original_filename character varying(255),
    source_file_mime_type character varying(255),
    source_file_uploaded_by_user_id bigint,
    source_file_uploaded_at timestamp(0) without time zone
);


ALTER TABLE public.source_record_packages OWNER TO dar_admin;

--
-- Name: source_record_packages_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.source_record_packages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.source_record_packages_id_seq OWNER TO dar_admin;

--
-- Name: source_record_packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.source_record_packages_id_seq OWNED BY public.source_record_packages.id;


--
-- Name: system_notifications; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.system_notifications (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    type character varying(80) NOT NULL,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    related_type character varying(255),
    related_id bigint,
    data json,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.system_notifications OWNER TO dar_admin;

--
-- Name: system_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.system_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_notifications_id_seq OWNER TO dar_admin;

--
-- Name: system_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.system_notifications_id_seq OWNED BY public.system_notifications.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dar_admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role character varying(20) DEFAULT 'landowner'::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO dar_admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dar_admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO dar_admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dar_admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: application_clearances id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_clearances ALTER COLUMN id SET DEFAULT nextval('public.application_clearances_id_seq'::regclass);


--
-- Name: application_documents id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents ALTER COLUMN id SET DEFAULT nextval('public.application_documents_id_seq'::regclass);


--
-- Name: application_parcels id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_parcels ALTER COLUMN id SET DEFAULT nextval('public.application_parcels_id_seq'::regclass);


--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: land_transfer_applications id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications ALTER COLUMN id SET DEFAULT nextval('public.land_transfer_applications_id_seq'::regclass);


--
-- Name: landholding_mutations id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations ALTER COLUMN id SET DEFAULT nextval('public.landholding_mutations_id_seq'::regclass);


--
-- Name: landholdings id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholdings ALTER COLUMN id SET DEFAULT nextval('public.landholdings_id_seq'::regclass);


--
-- Name: landowners id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landowners ALTER COLUMN id SET DEFAULT nextval('public.landowners_id_seq'::regclass);


--
-- Name: legacy_record_import_batches id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_record_import_batches ALTER COLUMN id SET DEFAULT nextval('public.legacy_record_import_batches_id_seq'::regclass);


--
-- Name: legacy_records id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records ALTER COLUMN id SET DEFAULT nextval('public.legacy_records_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: parcels id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.parcels ALTER COLUMN id SET DEFAULT nextval('public.parcels_id_seq'::regclass);


--
-- Name: required_documents id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.required_documents ALTER COLUMN id SET DEFAULT nextval('public.required_documents_id_seq'::regclass);


--
-- Name: source_record_package_import_batches id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_package_import_batches ALTER COLUMN id SET DEFAULT nextval('public.source_record_package_import_batches_id_seq'::regclass);


--
-- Name: source_record_packages id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages ALTER COLUMN id SET DEFAULT nextval('public.source_record_packages_id_seq'::regclass);


--
-- Name: system_notifications id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.system_notifications ALTER COLUMN id SET DEFAULT nextval('public.system_notifications_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: application_clearances; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.application_clearances (id, land_transfer_application_id, clearance_number, decision_status, application_code, transferor_name, transferee_name, municipality, barangay, total_area_hectares, parcel_snapshot, review_officer_name, reviewed_at, generated_by, generated_at, created_at, updated_at) FROM stdin;
1	1	DAR-CLR-2026-000001	denied	2026-0001	Jake Cuenca	Janus Espartero	\N	\N	0.0000	[]	DAR Staff Tester	2026-06-15 14:32:07	1	2026-06-15 14:32:07	2026-06-15 14:32:07	2026-06-15 14:32:07
2	3	DAR-CLR-2026-000003	released	2026-0003	Juan Reyes Dela Cruz	Roberto Garcia	Bayawan City	Banga	2.4000	[{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","parcel_number":"PARCEL-BANGA-001","title_no":"T-2026-0001","title_number":"T-2026-0001","tax_decl_no":"TD-2026-0001","lot_number":"LOT-1234-A","survey_plan_number":"SURV-BANGA-001","title_type":"oct","rod_office":"Negros Oriental Province","area_hectares":"2.4000","area_square_meters":"24000.00"}]	DAR Staff Tester	2026-06-16 21:07:10	1	2026-06-16 21:07:10	2026-06-16 21:07:10	2026-06-16 21:07:10
\.


--
-- Data for Name: application_documents; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.application_documents (id, land_transfer_application_id, required_document_id, original_filename, file_path, annex_reference, uploaded_by, remarks, created_at, updated_at, document_reference_number, document_metadata, metadata_encoded_by, metadata_encoded_at, source_record_id, source_record_package_id) FROM stdin;
1	1	6	System Flow Questions - DARLTCMS (ANSWERED).docx	application-documents/1/RrE7kDiOYJXuh8QeH0QSdSt4lyHjg2p1ArCJiLFz.docx	\N	1	\N	2026-06-15 12:02:32	2026-06-15 12:02:32	213123123	\N	1	2026-06-15 12:02:32	\N	\N
2	1	11	System Flow Questions - DARLTCMS (ANSWERED).docx	application-documents/1/myX61BZWyPONMo2IByVrxK722oFGqqTT7TTfjH35.docx	1	1	\N	2026-06-15 12:02:47	2026-06-15 12:02:47	123232	\N	1	2026-06-15 12:02:47	\N	\N
3	3	6	dar_iland_updated_blind_tester_guide.pdf	application-documents/3/zww1zrVmlGJyEnAbkKdJ07qVNwemLwKA3fuGmDMD.pdf	\N	1	\N	2026-06-16 20:56:35	2026-06-16 20:56:35	\N	\N	\N	\N	\N	\N
4	3	4	carryover14.txt	application-documents/3/1feCEyF4yWXVO6G3Cf9W1n2KVtHYU0PHMidjBrg8.txt	\N	1	\N	2026-06-16 20:59:49	2026-06-16 20:59:49	\N	\N	\N	\N	\N	\N
5	3	17	carryover14.txt	application-documents/3/7AbD0U1j0ND2ZGA8wy9ZDlsOR8nZPwKt8hMTg7FU.txt	\N	1	\N	2026-06-16 20:59:57	2026-06-16 20:59:57	\N	\N	\N	\N	\N	\N
6	3	2	carryover14.txt	application-documents/3/TRbLyC9ZKA3ekMvrMPBuq8YmB06xpetamaiiRE1M.txt	\N	1	\N	2026-06-16 21:00:41	2026-06-16 21:00:41	\N	\N	\N	\N	\N	\N
7	3	7	carryover14.txt	application-documents/3/DFdGsPgdhJJLYIWPQkRNyUue39BXkwQxL3l6Pb4B.txt	\N	1	\N	2026-06-16 21:06:12	2026-06-16 21:06:12	\N	\N	\N	\N	\N	\N
8	3	1	carryover14.txt	application-documents/3/gOgKpdgRlvim98TpWc7zqx2UwbCphTdHEFEPnuz3.txt	\N	1	\N	2026-06-16 21:06:17	2026-06-16 21:06:17	\N	\N	\N	\N	\N	\N
9	3	9	carryover14.txt	application-documents/3/l2n632FFOPVWpxzsRkQS6oPHWOljl9flLIYmQU3T.txt	\N	1	\N	2026-06-16 21:06:22	2026-06-16 21:06:22	\N	\N	\N	\N	\N	\N
10	3	8	carryover14.txt	application-documents/3/DKUOL1Vo02fWshhyQlz5RpOfZ3SBDHFhYFb2JpBn.txt	\N	1	\N	2026-06-16 21:06:27	2026-06-16 21:06:27	\N	\N	\N	\N	\N	\N
11	3	18	carryover14.txt	application-documents/3/hvhCzkPFvYTXbVj6RNaVejn9riIXaOmXqA5ZvsiH.txt	\N	1	\N	2026-06-16 21:06:32	2026-06-16 21:06:32	\N	\N	\N	\N	\N	\N
12	3	10	carryover14.txt	application-documents/3/sw8dfAjbDDqKlEEZWZWcFfAhTIe8v9sUZZSjTbNI.txt	\N	1	\N	2026-06-16 21:06:40	2026-06-16 21:06:40	\N	\N	\N	\N	\N	\N
13	3	15	carryover14.txt	application-documents/3/kIgkAHfaQbgDuHtIzPsXgkW7fLyDQPvX5qUvJPk9.txt	\N	1	\N	2026-06-16 21:06:52	2026-06-16 21:06:52	\N	{"marpo_no_tenants": "1", "marpo_has_tenants": "1"}	1	2026-06-16 21:06:52	\N	\N
14	3	12	carryover14.txt	application-documents/3/UxJSTe6pSqa6JgeN4qqRihPfpRw0jU1iuagDK8u7.txt	\N	1	\N	2026-06-16 21:06:57	2026-06-16 21:06:57	\N	\N	\N	\N	\N	\N
15	3	14	carryover14.txt	application-documents/3/xwRnFAEcVaIA8vQ8ERfzVfjlRhihc2McMKpVE2yX.txt	\N	1	\N	2026-06-16 21:07:02	2026-06-16 21:07:02	\N	\N	\N	\N	\N	\N
16	2	6	carryover15.txt	application-documents/2/VnZieHNWbxsKkiFW2hz1xZERNth70GR7rEKsn4pk.txt	\N	1	\N	2026-06-16 23:28:53	2026-06-16 23:28:53	\N	\N	\N	\N	\N	\N
17	2	10	carryover15.txt	application-documents/2/06dKtuXzSeSXUoYtEWYJCsGOcoMmgQdssJB93GAQ.txt	\N	1	\N	2026-06-17 01:09:07	2026-06-17 01:09:07	\N	\N	\N	\N	\N	\N
18	2	4	carryover15.txt	application-documents/2/s3LcyFBzzX1uZwoM1ADClpCouMC8t3SFSUlkz5pY.txt	\N	1	\N	2026-06-17 15:18:06	2026-06-17 15:18:06	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: application_parcels; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.application_parcels (id, land_transfer_application_id, parcel_id, area_hectares, parcel_code, title_no, tax_decl_no, created_at, updated_at, lot_number, survey_plan_number, title_type, rod_office, area_square_meters) FROM stdin;
1	3	1	2.4000	PARCEL-BANGA-001	T-2026-0001	TD-2026-0001	2026-06-16 20:51:59	2026-06-16 20:51:59	LOT-1234-A	SURV-BANGA-001	oct	Negros Oriental Province	24000.00
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.audit_logs (id, actor_user_id, land_transfer_application_id, auditable_type, auditable_id, action, metadata, ip_address, user_agent, created_at, updated_at) FROM stdin;
1	1	1	App\\Models\\LandTransferApplication	1	application_created	{"status":"pending_legal_review","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","parcel_id":null,"scope_note":"Application encoding only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:00:05	2026-06-15 12:00:05
2	1	1	App\\Models\\Landowner	1	landowner_record_created_from_application_party	{"party":"transferor","display_party":"Transferor","source_name":"Jake Cuenca","created_landowner_id":1,"linked_field":"transferor_landowner_id","scope_note":"A landowner\\/person record was created for application processing and traceability only. This does not transfer ownership, create a landholding, assign a parcel, or mutate registry records."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:01:00	2026-06-15 12:01:00
3	1	1	App\\Models\\Landowner	2	landowner_record_created_from_application_party	{"party":"transferee","display_party":"Transferee","source_name":"Janus Espartero","created_landowner_id":2,"linked_field":"transferee_landowner_id","scope_note":"A landowner\\/person record was created for application processing and traceability only. This does not transfer ownership, create a landholding, assign a parcel, or mutate registry records."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:01:02	2026-06-15 12:01:02
4	1	1	App\\Models\\LandTransferApplication	1	application_landowner_links_updated	{"old_links":{"transferor_landowner_id":1,"transferee_landowner_id":2},"new_links":{"transferor_landowner_id":"1","transferee_landowner_id":"2"},"scope_note":"Landowner records were linked to the clearance application for review, validation, and traceability only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:01:04	2026-06-15 12:01:04
5	1	1	App\\Models\\ApplicationDocument	1	document_uploaded	{"required_document_id":6,"required_document_name":"Affidavit of Transferor","original_filename":"System Flow Questions - DARLTCMS (ANSWERED).docx","annex_reference":null,"document_reference_number":"213123123","document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:02:32	2026-06-15 12:02:32
6	1	1	App\\Models\\ApplicationDocument	2	document_uploaded	{"required_document_id":11,"required_document_name":"Death Certificate (if applicable)","original_filename":"System Flow Questions - DARLTCMS (ANSWERED).docx","annex_reference":"1","document_reference_number":"123232","document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:02:47	2026-06-15 12:02:47
7	1	1	App\\Models\\LandTransferApplication	1	application_status_advanced	{"old_status":"pending_legal_review","new_status":"endorsed_lti","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:53:20	2026-06-15 12:53:20
8	1	1	App\\Models\\LandTransferApplication	1	application_status_advanced	{"old_status":"endorsed_lti","new_status":"endorsed_chief_legal","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:53:26	2026-06-15 12:53:26
9	1	1	App\\Models\\LandTransferApplication	1	application_status_advanced	{"old_status":"endorsed_chief_legal","new_status":"endorsed_parpo","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:53:33	2026-06-15 12:53:33
10	1	1	App\\Models\\LandTransferApplication	1	application_status_advanced	{"old_status":"endorsed_parpo","new_status":"for_releasing","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 12:53:39	2026-06-15 12:53:39
11	1	\N	App\\Models\\User	6	user_created	{"created_user_id":6,"created_user_email":"jake.landowner@gmail.com","created_user_role":"landowner","is_active":true,"linked_landowner_id":"1"}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 13:46:55	2026-06-15 13:46:55
12	1	1	App\\Models\\LandTransferApplication	1	application_denied	{"decision_reason":"kulang","decision_notes":null,"validated_at":"2026-06-15 14:32:07","has_validation_snapshot":true,"registry_mutation_performed":false}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 14:32:07	2026-06-15 14:32:07
13	1	1	App\\Models\\ApplicationClearance	1	clearance_generated	{"clearance_number":"DAR-CLR-2026-000001","decision_status":"denied","total_area_hectares":"0.0000","parcel_count":0}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 14:32:07	2026-06-15 14:32:07
14	1	2	App\\Models\\LandTransferApplication	2	application_created	{"status":"pending_legal_review","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","parcel_id":null,"scope_note":"Application encoding only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 15:03:41	2026-06-15 15:03:41
15	1	2	App\\Models\\LandTransferApplication	2	application_status_advanced	{"old_status":"pending_legal_review","new_status":"endorsed_lti","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 22:04:34	2026-06-15 22:04:34
30	1	3	App\\Models\\LandTransferApplication	3	application_status_advanced	{"old_status":"endorsed_lti","new_status":"endorsed_chief_legal","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:58:08	2026-06-16 20:58:08
16	1	\N	App\\Models\\User	6	user_updated	{"updated_user_id":6,"updated_user_email":"jake.landowner@gmail.com","old_values":{"name":"Jake Cuenca","email":"jake.landowner@gmail.com","role":"landowner","is_active":true,"linked_landowner_id":1},"new_values":{"name":"Jake Cuenca","email":"jake.landowner@gmail.com","role":"landowner","is_active":true,"linked_landowner_id":1},"password_changed":true}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 22:10:20	2026-06-15 22:10:20
17	1	\N	App\\Models\\User	2	user_updated	{"updated_user_id":2,"updated_user_email":"jay.staff@dar-ltcms.local","old_values":{"name":"Jay","email":"jay.staff@dar-ltcms.local","role":"staff","is_active":true,"linked_landowner_id":null},"new_values":{"name":"Jay","email":"jay.staff@dar-ltcms.local","role":"geodetic","is_active":true,"linked_landowner_id":null},"password_changed":false}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-15 22:11:48	2026-06-15 22:11:48
18	1	\N	App\\Models\\Landowner	3	landowner_record_created	{"new_values":{"first_name":"Juan","middle_name":"Reyes","last_name":"Dela Cruz","suffix":null,"registered_owner_status":null,"spouse_name":null,"contact_number":"09171234567","address_line":"Purok 2","barangay":"Bantayan","municipality":"Bayawan City","province":"Negros Oriental","user_id":null},"scope_note":"Administrative landowner\\/person record creation only. Landholding and parcel linkage must be encoded separately."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:30:13	2026-06-16 20:30:13
19	1	\N	App\\Models\\Landowner	4	landowner_record_created	{"new_values":{"first_name":"Maria","middle_name":"Lopez","last_name":"Santos","suffix":null,"registered_owner_status":"married","spouse_name":"Richard Santos","contact_number":"09179876543","address_line":"Natl. Highway","barangay":"Poblacion","municipality":"Dumaguete City","province":"Negros Oriental","user_id":null},"scope_note":"Administrative landowner\\/person record creation only. Landholding and parcel linkage must be encoded separately."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:30:50	2026-06-16 20:30:50
20	1	\N	App\\Models\\Landowner	5	landowner_record_created	{"new_values":{"first_name":"Renato","middle_name":"Flores","last_name":"Villanueva","suffix":null,"registered_owner_status":null,"spouse_name":null,"contact_number":"09175551234","address_line":"Purok 5","barangay":"Nangka","municipality":"Bayawan City","province":"Negros Oriental","user_id":null},"scope_note":"Administrative landowner\\/person record creation only. Landholding and parcel linkage must be encoded separately."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:31:15	2026-06-16 20:31:15
21	1	\N	App\\Models\\Parcel	1	parcel_created	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","municipality":null,"barangay":null,"area_hectares":"2.4000","dar_clearance_scope":"Agricultural land clearance record only","has_geometry":false,"actor_user_id":1,"actor_name":"DAR Staff Tester"}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:35:32	2026-06-16 20:35:32
22	1	\N	App\\Models\\Landholding	1	landholding_record_created	{"landowner_id":3,"area_hectares":"2.4000","status":"active","scope_note":"Administrative landholding record encoded for monitoring and assistive hectare validation only. This does not mutate registry records or execute ownership transfer."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:45:55	2026-06-16 20:45:55
23	1	\N	App\\Models\\SourceRecordPackage	1	source_record_package_encoded	{"package_code":"SRC-PKG-20260616204751-NYHU","source_record_scope":"current_active","parcel_id":"1","parcel_code":"PARCEL-BANGA-001","records_created":3,"source_file_attached":false}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:47:51	2026-06-16 20:47:51
24	1	\N	App\\Models\\SourceRecordPackage	1	source_record_package_linked_to_landowner	{"package_code":"SRC-PKG-20260616204751-NYHU","landowner_id":3,"landowner_name":"Juan Reyes Dela Cruz","records_linked":3,"scope_note":"Administrative source-to-landowner linkage only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:48:01	2026-06-16 20:48:01
25	1	3	App\\Models\\LandTransferApplication	3	application_created	{"status":"pending_legal_review","applicant_name":"Juan Reyes Dela Cruz","applicant_type":"transferor","or_number":"OR-JDC-2026-001","transfer_nature":"sale","is_succession_case":false,"retention_certificate_required":false,"retention_certificate_reference":null,"transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","parcel_id":"1","scope_note":"Application encoding only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:51:59	2026-06-16 20:51:59
26	1	3	App\\Models\\Landowner	6	landowner_record_created_from_application_party	{"party":"transferee","display_party":"Transferee","source_name":"Roberto Garcia","created_landowner_id":6,"linked_field":"transferee_landowner_id","scope_note":"A landowner\\/person record was created for application processing and traceability only. This does not transfer ownership, create a landholding, assign a parcel, or mutate registry records."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:52:05	2026-06-16 20:52:05
27	1	3	App\\Models\\LandTransferApplication	3	ltc_form4_review_updated	{"recommendation_decision":"approval","subject_land_findings_count":1,"recommendation_findings_count":3}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:55:42	2026-06-16 20:55:42
28	1	3	App\\Models\\ApplicationDocument	3	document_uploaded	{"required_document_id":6,"required_document_name":"Affidavit of Transferor","original_filename":"dar_iland_updated_blind_tester_guide.pdf","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:56:35	2026-06-16 20:56:35
29	1	3	App\\Models\\LandTransferApplication	3	application_status_advanced	{"old_status":"pending_legal_review","new_status":"endorsed_lti","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:57:56	2026-06-16 20:57:56
31	1	3	App\\Models\\LandTransferApplication	3	application_status_advanced	{"old_status":"endorsed_chief_legal","new_status":"endorsed_parpo","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:59:15	2026-06-16 20:59:15
32	1	3	App\\Models\\LandTransferApplication	3	application_status_advanced	{"old_status":"endorsed_parpo","new_status":"for_releasing","scope_note":"Status advancement only. No ownership transfer or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:59:19	2026-06-16 20:59:19
33	1	3	App\\Models\\ApplicationDocument	4	document_uploaded	{"required_document_id":4,"required_document_name":"Deed of Transfer \\/ Deed of Sale \\/ Donation (Registered)","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:59:49	2026-06-16 20:59:49
34	1	3	App\\Models\\ApplicationDocument	5	document_uploaded	{"required_document_id":17,"required_document_name":"Deed or Document to be Registered","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 20:59:57	2026-06-16 20:59:57
35	1	3	App\\Models\\ApplicationDocument	6	document_uploaded	{"required_document_id":2,"required_document_name":"Electronic Copy of Title","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:00:41	2026-06-16 21:00:41
36	1	3	App\\Models\\ApplicationDocument	7	document_uploaded	{"required_document_id":7,"required_document_name":"Municipal Assessor's Certificate of Aggregate Landholding","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:12	2026-06-16 21:06:12
37	1	3	App\\Models\\ApplicationDocument	8	document_uploaded	{"required_document_id":1,"required_document_name":"Official Receipt (LTC Fee Payment)","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:17	2026-06-16 21:06:17
38	1	3	App\\Models\\ApplicationDocument	9	document_uploaded	{"required_document_id":9,"required_document_name":"Provincial Assessor's Certificate of Aggregate Landholding","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:22	2026-06-16 21:06:22
39	1	3	App\\Models\\ApplicationDocument	10	document_uploaded	{"required_document_id":8,"required_document_name":"City Assessor's Certificate of Aggregate Landholding","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:27	2026-06-16 21:06:27
40	1	3	App\\Models\\ApplicationDocument	11	document_uploaded	{"required_document_id":18,"required_document_name":"Death Certificate (if applicable)","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:32	2026-06-16 21:06:32
41	1	3	App\\Models\\ApplicationDocument	12	document_uploaded	{"required_document_id":10,"required_document_name":"Affidavit of Transferee","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:40	2026-06-16 21:06:40
42	1	3	App\\Models\\ApplicationDocument	13	document_uploaded	{"required_document_id":15,"required_document_name":"MARPO Certification (LTC Form No. 2)","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":{"marpo_has_tenants":"1","marpo_no_tenants":"1"},"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:52	2026-06-16 21:06:52
43	1	3	App\\Models\\ApplicationDocument	14	document_uploaded	{"required_document_id":12,"required_document_name":"Municipal Assessor's Certificate of Aggregate Landholding","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:06:57	2026-06-16 21:06:57
44	1	3	App\\Models\\ApplicationDocument	15	document_uploaded	{"required_document_id":14,"required_document_name":"Provincial Assessor's Certificate of Aggregate Landholding","original_filename":"carryover14.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:07:02	2026-06-16 21:07:02
45	1	3	App\\Models\\LandTransferApplication	3	application_released	{"decision_reason":null,"decision_notes":null,"validated_at":"2026-06-16 21:07:10","has_validation_snapshot":true,"registry_mutation_performed":false}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:07:10	2026-06-16 21:07:10
46	1	3	App\\Models\\ApplicationClearance	2	clearance_generated	{"clearance_number":"DAR-CLR-2026-000003","decision_status":"released","total_area_hectares":"2.4000","parcel_count":1}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 21:07:10	2026-06-16 21:07:10
47	1	2	App\\Models\\ApplicationDocument	16	document_uploaded	{"required_document_id":6,"required_document_name":"Affidavit of Transferor","original_filename":"carryover15.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-16 23:28:53	2026-06-16 23:28:53
48	1	2	App\\Models\\ApplicationDocument	17	document_uploaded	{"required_document_id":10,"required_document_name":"Affidavit of Transferee","original_filename":"carryover15.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 01:09:07	2026-06-17 01:09:07
49	1	\N	App\\Models\\Parcel	1	parcel_updated	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","status":"active","has_geometry":true,"actor_user_id":1,"actor_name":"DAR Staff Tester"}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 15:03:45	2026-06-17 15:03:45
50	1	\N	App\\Models\\Parcel	2	parcel_created	{"parcel_id":2,"parcel_code":"PARCEL-BANGA-002","municipality":null,"barangay":null,"area_hectares":"0.0001","dar_clearance_scope":"Agricultural land clearance record only","has_geometry":false,"actor_user_id":1,"actor_name":"DAR Staff Tester"}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 15:05:38	2026-06-17 15:05:38
51	1	\N	App\\Models\\Parcel	2	parcel_updated	{"parcel_id":2,"parcel_code":"PARCEL-BANGA-002","status":"active","has_geometry":true,"actor_user_id":1,"actor_name":"DAR Staff Tester"}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 15:05:54	2026-06-17 15:05:54
52	1	\N	App\\Models\\Parcel	2	parcel_updated	{"parcel_id":2,"parcel_code":"PARCEL-BANGA-002","status":"active","has_geometry":true,"actor_user_id":1,"actor_name":"DAR Staff Tester"}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 15:06:46	2026-06-17 15:06:46
53	1	\N	App\\Models\\Parcel	2	parcel_archived	{"parcel_id":2,"parcel_code":"PARCEL-BANGA-002","old_status":"active","new_status":"inactive","actor_user_id":1,"actor_name":"DAR Staff Tester","archive_policy":"Record retained; no ownership or registry mutation performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 15:14:29	2026-06-17 15:14:29
54	1	2	App\\Models\\ApplicationDocument	18	document_uploaded	{"required_document_id":4,"required_document_name":"Deed of Transfer \\/ Deed of Sale \\/ Donation (Registered)","original_filename":"carryover15.txt","annex_reference":null,"document_reference_number":null,"document_metadata":null,"source_record_id":null,"source_record_package_id":null,"file_replaced":true,"scope_note":"Document\\/source record linking is for traceability and review only. No ownership transfer or registry mutation was performed."}	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	2026-06-17 15:18:06	2026-06-17 15:18:06
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: land_transfer_applications; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.land_transfer_applications (id, application_code, transferor_name, transferee_name, municipality, barangay, date_filed, date_of_transfer, status, remarks, encoded_by, reviewed_by, reviewed_at, created_at, updated_at, transferee_landowner_id, decision_notes, decision_reason, validated_at, validation_snapshot, transferor_landowner_id, registry_mutated_at, registry_mutated_by, applicant_name, applicant_type, authorized_representative_name, has_special_power_of_attorney, or_number, or_date, amount_paid, date_of_application, transfer_nature, is_succession_case, retention_certificate_required, retention_certificate_reference, landholding_review_notes, ltc_form4_subject_land_findings, ltc_form4_recommendation_findings, ltc_form4_recommendation_decision, ltc_form4_other_findings, ltc_form4_certified_at, ltc_form4_certifying_officer_name) FROM stdin;
1	2026-0001	Jake Cuenca	Janus Espartero	\N	\N	\N	\N	denied	\N	1	1	2026-06-15 14:32:07	2026-06-15 12:00:05	2026-06-15 14:32:07	2	\N	kulang	2026-06-15 14:32:07	{"computed_at":"2026-06-15 14:32:07","five_hectare":{"current_approved_total":0,"pending_incoming_total":0,"this_application_total":0,"projected_total":0,"remaining_after_projection":5,"exceeds_limit":false,"limit":5,"scope_note":"Computed from encoded active landholding records and pending\\/current clearance application areas only. This is assistive for staff review and is not a final legal ownership determination."},"documents":{"missing_mandatory_count":10,"missing_mandatory_ids":[1,2,3,4,7,9,10,12,14,15],"missing_mandatory_by_party":{"transferor":[{"id":1,"name":"Official Receipt (LTC Fee Payment)"},{"id":2,"name":"Electronic Copy of Title"},{"id":3,"name":"Recent Tax Declaration"},{"id":4,"name":"Deed of Transfer \\/ Deed of Sale \\/ Donation (Registered)"},{"id":7,"name":"Municipal Assessor's Certificate of Aggregate Landholding"},{"id":9,"name":"Provincial Assessor's Certificate of Aggregate Landholding"}],"transferee":[{"id":10,"name":"Affidavit of Transferee"},{"id":12,"name":"Municipal Assessor's Certificate of Aggregate Landholding"},{"id":14,"name":"Provincial Assessor's Certificate of Aggregate Landholding"},{"id":15,"name":"MARPO Certification (LTC Form No. 2)"}]},"missing_mandatory_names":["Official Receipt (LTC Fee Payment)","Electronic Copy of Title","Recent Tax Declaration","Deed of Transfer \\/ Deed of Sale \\/ Donation (Registered)","Municipal Assessor's Certificate of Aggregate Landholding","Provincial Assessor's Certificate of Aggregate Landholding","Affidavit of Transferee","Municipal Assessor's Certificate of Aggregate Landholding","Provincial Assessor's Certificate of Aggregate Landholding","MARPO Certification (LTC Form No. 2)"]}}	1	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N
2	2026-0002	Janus Espartero	Jake Cuenca	\N	\N	\N	\N	endorsed_lti	\N	1	\N	\N	2026-06-15 15:03:41	2026-06-15 22:04:34	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N	f	\N	\N	\N	\N	\N	f	f	\N	\N	\N	\N	\N	\N	\N	\N
3	2026-0003	Juan Reyes Dela Cruz	Roberto Garcia	Bayawan City	Banga	\N	\N	released	\N	1	1	2026-06-16 21:07:10	2026-06-16 20:51:59	2026-06-16 21:07:10	6	\N	\N	2026-06-16 21:07:10	{"computed_at":"2026-06-16 21:07:10","five_hectare":{"current_approved_total":0,"pending_incoming_total":0,"this_application_total":2.4,"projected_total":2.4,"remaining_after_projection":2.6,"exceeds_limit":false,"succession_exception_claimed":false,"retention_certificate_required":false,"retention_certificate_reference":null,"retention_certificate_missing":false,"blocks_release":false,"limit":5,"scope_note":"Computed from encoded active landholding records and pending\\/current clearance application areas only. Succession and retention-certificate entries are staff review context, not automatic legal determinations."},"documents":{"classification_scope":"Only acceptance\\/release-blocking documents are counted as critical blockers. Case-dependent and reference-only documents remain visible for manual review.","missing_mandatory_count":0,"missing_mandatory_ids":[],"missing_mandatory_by_party":[],"missing_mandatory_names":[]}}	3	\N	\N	Juan Reyes Dela Cruz	transferor	\N	f	OR-JDC-2026-001	2026-05-19	50.00	2026-06-15	sale	f	f	\N	\N	["ra6657_not_covered_not_tenanted_retained_area"]	["application_complete","requirements_complete_consistent","no_pending_case_or_conflict"]	approval	\N	2026-06-16	Chief Legal Test Officer
\.


--
-- Data for Name: landholding_mutations; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.landholding_mutations (id, land_transfer_application_id, parcel_id, transferor_landowner_id, transferee_landowner_id, transferred_area_hectares, transferor_before_area, transferor_after_area, transferee_before_area, transferee_after_area, mutated_by, mutated_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: landholdings; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.landholdings (id, landowner_id, parcel_id, area_hectares, status, date_acquired, date_transferred, source_application_id, remarks, created_at, updated_at, source_reference_number, reference_photo_path) FROM stdin;
1	3	1	2.4000	active	\N	\N	\N	\N	2026-06-16 20:45:55	2026-06-16 20:45:55	Title: T-2026-0001	\N
\.


--
-- Data for Name: landowners; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.landowners (id, first_name, middle_name, last_name, suffix, contact_number, address_line, barangay, municipality, province, user_id, created_at, updated_at, registered_owner_status, spouse_name) FROM stdin;
2	Janus	\N	Espartero	\N	\N	\N	\N	\N	Negros Oriental	\N	2026-06-15 12:01:02	2026-06-15 12:01:02	\N	\N
1	Jake	\N	Cuenca	\N	\N	\N	\N	\N	Negros Oriental	6	2026-06-15 12:01:00	2026-06-15 22:10:20	\N	\N
3	Juan	Reyes	Dela Cruz	\N	09171234567	Purok 2	Bantayan	Bayawan City	Negros Oriental	\N	2026-06-16 20:30:13	2026-06-16 20:30:13	\N	\N
4	Maria	Lopez	Santos	\N	09179876543	Natl. Highway	Poblacion	Dumaguete City	Negros Oriental	\N	2026-06-16 20:30:50	2026-06-16 20:30:50	married	Richard Santos
5	Renato	Flores	Villanueva	\N	09175551234	Purok 5	Nangka	Bayawan City	Negros Oriental	\N	2026-06-16 20:31:15	2026-06-16 20:31:15	\N	\N
6	Roberto	\N	Garcia	\N	\N	\N	Banga	Bayawan City	Negros Oriental	\N	2026-06-16 20:52:05	2026-06-16 20:52:05	\N	\N
\.


--
-- Data for Name: legacy_record_import_batches; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.legacy_record_import_batches (id, record_type, original_filename, status, total_rows, valid_rows, error_rows, duplicate_rows, committed_rows, uploaded_by_user_id, committed_by_user_id, committed_at, summary, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: legacy_records; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.legacy_records (id, record_type, origin, legacy_record_import_batch_id, encoded_by_user_id, title_number, control_number, tax_declaration_number, lot_number, survey_number, landowner_name, transferor_name, transferee_name, area_hectares, crop_or_land_use, barangay, municipality, province, record_date, decision_status, previous_dar_reference_number, remarks, source_book, page_number, transcribed_by, transcription_date, source_notes, created_at, updated_at, parcel_id, source_record_scope, parcel_code, source_geometry_geojson, landholding_reference_number, application_reference_number, boundary_description, source_record_package_id, landowner_id) FROM stdin;
1	title	encoded	\N	1	T-2026-0001	\N	\N	\N	\N	Juan Reyes Dela Cruz	\N	\N	\N	\N	Banga	Bayawan City	Negros Oriental	\N	\N	\N	\N	Secret	12	DAR Staff Tester	2026-06-16	\N	2026-06-16 20:47:51	2026-06-16 20:48:01	1	current_active	PARCEL-BANGA-001	\N	\N	\N	\N	1	3
2	landholding	encoded	\N	1	T-2026-0001	\N	\N	\N	\N	Juan Reyes Dela Cruz	\N	\N	\N	\N	Banga	Bayawan City	Negros Oriental	\N	\N	\N	\N	Secret	12	DAR Staff Tester	2026-06-16	\N	2026-06-16 20:47:51	2026-06-16 20:48:01	1	current_active	PARCEL-BANGA-001	\N	LH-PKG-001	\N	\N	1	3
3	parcel_source	encoded	\N	1	T-2026-0001	\N	\N	\N	\N	Juan Reyes Dela Cruz	\N	\N	\N	\N	Banga	Bayawan City	Negros Oriental	\N	\N	\N	\N	Secret	12	DAR Staff Tester	2026-06-16	\N	2026-06-16 20:47:51	2026-06-16 20:48:01	1	current_active	PARCEL-BANGA-001	\N	\N	\N	\N	1	3
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_02_24_155515_add_role_to_users_table	1
5	2026_02_24_164702_create_land_transfer_applications_table	1
6	2026_02_24_164849_create_application_parcels_table	1
7	2026_02_24_165054_create_parcels_table	1
8	2026_02_24_165302_add_parcel_fk_to_application_parcels_table	1
9	2026_02_24_165903_create_required_documents_table	1
10	2026_02_24_170813_create_application_documents_table	1
11	2026_02_24_195857_create_landowners_table	1
12	2026_02_24_200203_create_landholdings_table	1
13	2026_02_24_201614_add_transferee_landowner_id_to_land_transfer_applications_table	1
14	2026_02_28_082534_add_decision_fields_to_land_transfer_applications_table	1
15	2026_03_01_172237_add_transferor_and_mutation_fields_to_land_transfer_applications_table	1
16	2026_03_01_172239_create_landholding_mutations_table	1
17	2026_03_14_150505_harden_land_registry_constraints_and_indexes	1
18	2026_03_15_000001_create_application_clearances_table	1
19	2026_05_04_083341_create_audit_logs_table	1
20	2026_05_04_094235_add_metadata_fields_to_application_documents_table	1
21	2026_05_05_143435_add_is_active_to_users_table	1
22	2026_05_05_143914_add_unique_user_link_to_landowners_table	1
23	2026_05_06_000100_create_legacy_record_import_batches_table	1
24	2026_05_06_000110_create_legacy_records_table	1
25	2026_05_06_000130_add_parcel_linking_to_legacy_records_table	1
26	2026_05_06_000140_create_source_record_packages_table	1
27	2026_05_06_000150_add_source_record_package_id_to_legacy_records_table	1
28	2026_05_06_000160_create_source_record_package_import_batches_table	1
29	2026_05_17_170000_add_source_record_links_to_application_documents_table	1
30	2026_05_17_180000_add_landowner_links_to_source_records_table	1
31	2026_05_17_190000_add_source_reference_number_to_landholdings_table	1
32	2026_05_18_100000_add_agricultural_status_to_parcels_table	1
33	2026_05_18_210000_create_system_notifications_table	1
34	2026_05_19_235900_add_reference_photo_paths_to_parcels_and_landholdings	1
35	2026_05_20_000100_add_source_file_fields_to_source_record_packages_table	1
36	2026_06_15_180000_add_official_intake_fields_to_land_transfer_applications_table	2
37	2026_06_15_000200_add_registration_reference_fields_to_parcels_table	3
38	2026_06_15_000210_add_registration_reference_fields_to_application_parcels_table	3
39	2026_06_15_000300_add_registered_owner_identity_fields_to_landowners_table	4
40	2026_06_15_000400_add_requirement_classification_to_required_documents_table	5
41	2026_06_15_000500_add_landholding_review_context_to_land_transfer_applications_table	6
42	2026_06_15_000500_normalize_application_status_values	7
43	2026_06_15_000600_add_ltc_form4_review_fields_to_land_transfer_applications_table	8
\.


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.parcels (id, parcel_code, title_no, tax_decl_no, municipality, barangay, province, area_hectares, geometry_geojson, status, remarks, created_at, updated_at, agricultural_status, reference_photo_path, lot_number, survey_plan_number, title_type, rod_office, area_square_meters) FROM stdin;
1	PARCEL-BANGA-001	T-2026-0001	TD-2026-0001	Bayawan City	Banga	Negros Oriental	2.4000	{"type":"Polygon","coordinates":[[[122.795,9.355],[122.8095,9.3585],[122.8072,9.3692],[122.7962,9.365],[122.795,9.355]]]}	active	\N	2026-06-16 20:35:32	2026-06-17 15:03:45	private_agricultural	\N	LOT-1234-A	SURV-BANGA-001	oct	Negros Oriental Province	24000.00
2	PARCEL-BANGA-002	TCT-DEMO-0004	TD-2026-0002	\N	\N	Negros Oriental	0.0001	{"type":"Polygon","coordinates":[[[122.795,9.355],[122.8095,9.3585],[122.8072,9.3692],[122.7962,9.365],[122.795,9.355]]]}	inactive	Archived by staff on Jun 17, 2026 03:14 PM. Record retained for traceability.	2026-06-17 15:05:38	2026-06-17 15:14:29	private_agricultural	\N	12	SURV-VILLAR-02	\N	\N	1.20
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: required_documents; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.required_documents (id, name, applies_to, is_mandatory, legal_basis, created_at, updated_at, requirement_classification, blocks_acceptance, classification_notes) FROM stdin;
9	Provincial Assessor's Certificate of Aggregate Landholding	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Aggregate landholding certification used for 5-hectare review.
10	Affidavit of Transferee	transferee	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Required sworn statement used for transferee review.
12	Municipal Assessor's Certificate of Aggregate Landholding	transferee	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Aggregate landholding certification used for 5-hectare review.
4	Deed of Transfer / Deed of Sale / Donation (Registered)	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 11:18:20	mandatory	t	\N
13	City Assessor's Certificate of Aggregate Landholding	transferee	f	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	case_dependent	f	Case-dependent assessor certification depending on location/jurisdiction.
14	Provincial Assessor's Certificate of Aggregate Landholding	transferee	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Aggregate landholding certification used for 5-hectare review.
15	MARPO Certification (LTC Form No. 2)	transferee	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Required certification for tenant/program coverage review.
3	Recent Tax Declaration	transferor	f	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 11:18:20	reference	f	Tax Declaration is supplemental/reference for clearance review and assessor classification context; it is not an automatic release blocker by itself.
11	Death Certificate (if applicable)	transferee	f	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 11:18:20	case_dependent	f	Required only when deceased persons are indicated in the transfer instrument.
1	Official Receipt (LTC Fee Payment)	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Payment/reference intake document for accepted application records.
2	Electronic Copy of Title	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Title proof required for parcel/title review. Certified True Copy details may be encoded in document metadata.
16	Recent Tax Declaration (if available)	transferor	f	DAR A.O. No. 4, s. 2021	2026-06-15 20:21:11	2026-06-15 20:21:11	reference	f	Reference document when available. It may support assessor classification and tax declaration number encoding but is not a release blocker by itself.
17	Deed or Document to be Registered	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 20:21:11	2026-06-15 20:21:11	mandatory	t	Transfer instrument required for review of transfer parties and registration details. Metadata may include notarization date, notary public, page, book, document number, and series.
18	Death Certificate (if applicable)	transferor	f	DAR A.O. No. 4, s. 2021	2026-06-15 20:21:11	2026-06-15 20:21:11	case_dependent	f	Required only when deceased persons are indicated in the transfer instrument.
6	Affidavit of Transferor	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Required sworn statement used for transferor review.
7	Municipal Assessor's Certificate of Aggregate Landholding	transferor	t	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	mandatory	t	Aggregate landholding certification used for 5-hectare review.
8	City Assessor's Certificate of Aggregate Landholding	transferor	f	DAR A.O. No. 4, s. 2021	2026-06-15 11:18:20	2026-06-15 20:21:11	case_dependent	f	Case-dependent assessor certification depending on location/jurisdiction.
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: source_record_package_import_batches; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.source_record_package_import_batches (id, original_filename, status, total_rows, valid_rows, error_rows, duplicate_rows, committed_rows, uploaded_by_user_id, committed_by_user_id, committed_at, preview_rows, summary, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: source_record_packages; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.source_record_packages (id, package_code, status, source_record_scope, parcel_id, encoded_by_user_id, parcel_code, title_number, landholding_reference_number, control_number, landowner_name, transferor_name, transferee_name, lot_number, survey_number, area_hectares, crop_or_land_use, barangay, municipality, province, source_geometry_geojson, boundary_description, source_book, page_number, transcribed_by, transcription_date, source_notes, remarks, created_at, updated_at, landowner_id, source_file_path, source_file_original_filename, source_file_mime_type, source_file_uploaded_by_user_id, source_file_uploaded_at) FROM stdin;
1	SRC-PKG-20260616204751-NYHU	linked	current_active	1	1	PARCEL-BANGA-001	T-2026-0001	LH-PKG-001	\N	Juan Reyes Dela Cruz	\N	\N	\N	\N	\N	\N	Banga	Bayawan City	Negros Oriental	\N	\N	Secret	12	DAR Staff Tester	2026-06-16	\N	\N	2026-06-16 20:47:51	2026-06-16 20:48:01	3	\N	\N	\N	\N	\N
\.


--
-- Data for Name: system_notifications; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.system_notifications (id, user_id, type, title, message, related_type, related_id, data, read_at, created_at, updated_at) FROM stdin;
2	2	application_created	Clearance application encoded	A clearance application was encoded: 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"pending_legal_review","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 12:00:05	2026-06-15 12:00:05
3	3	application_created	Clearance application encoded	A clearance application was encoded: 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"pending_legal_review","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 12:00:05	2026-06-15 12:00:05
4	4	application_created	Clearance application encoded	A clearance application was encoded: 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"pending_legal_review","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 12:00:05	2026-06-15 12:00:05
5	5	application_created	Clearance application encoded	A clearance application was encoded: 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"pending_legal_review","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 12:00:05	2026-06-15 12:00:05
7	2	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 12:53:20	2026-06-15 12:53:20
8	3	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 12:53:20	2026-06-15 12:53:20
9	4	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 12:53:20	2026-06-15 12:53:20
10	5	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 12:53:20	2026-06-15 12:53:20
12	2	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-15 12:53:26	2026-06-15 12:53:26
13	3	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-15 12:53:26	2026-06-15 12:53:26
14	4	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-15 12:53:26	2026-06-15 12:53:26
15	5	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-15 12:53:26	2026-06-15 12:53:26
17	2	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-15 12:53:33	2026-06-15 12:53:33
18	3	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-15 12:53:33	2026-06-15 12:53:33
19	4	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-15 12:53:33	2026-06-15 12:53:33
20	5	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-15 12:53:33	2026-06-15 12:53:33
22	2	application_status_updated	Application status updated	Application 2026-0001 is now For Releasing.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-15 12:53:39	2026-06-15 12:53:39
23	3	application_status_updated	Application status updated	Application 2026-0001 is now For Releasing.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-15 12:53:39	2026-06-15 12:53:39
24	4	application_status_updated	Application status updated	Application 2026-0001 is now For Releasing.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-15 12:53:39	2026-06-15 12:53:39
25	5	application_status_updated	Application status updated	Application 2026-0001 is now For Releasing.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-15 12:53:39	2026-06-15 12:53:39
1	1	application_created	Clearance application encoded	A clearance application was encoded: 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"pending_legal_review","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	2026-06-15 13:52:59	2026-06-15 12:00:05	2026-06-15 13:52:59
6	1	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"pending_legal_review","new_status":"endorsed_lti"}	2026-06-15 13:52:59	2026-06-15 12:53:20	2026-06-15 13:52:59
11	1	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	2026-06-15 13:52:59	2026-06-15 12:53:26	2026-06-15 13:52:59
16	1	application_status_updated	Application status updated	Application 2026-0001 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	2026-06-15 13:52:59	2026-06-15 12:53:33	2026-06-15 13:52:59
21	1	application_status_updated	Application status updated	Application 2026-0001 is now For Releasing.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","old_status":"endorsed_parpo","new_status":"for_releasing"}	2026-06-15 13:52:59	2026-06-15 12:53:39	2026-06-15 13:52:59
27	2	application_denied	Application denied	A final denied clearance decision was recorded for application 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"denied","status_label":"Denied","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 14:32:07	2026-06-15 14:32:07
28	3	application_denied	Application denied	A final denied clearance decision was recorded for application 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"denied","status_label":"Denied","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 14:32:07	2026-06-15 14:32:07
29	4	application_denied	Application denied	A final denied clearance decision was recorded for application 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"denied","status_label":"Denied","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 14:32:07	2026-06-15 14:32:07
30	5	application_denied	Application denied	A final denied clearance decision was recorded for application 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"denied","status_label":"Denied","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 14:32:07	2026-06-15 14:32:07
31	6	landowner_final_decision	Final clearance decision recorded	A final clearance decision has been recorded for application 2026-0001. Decision status: Denied.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"denied","status_label":"Denied","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	\N	2026-06-15 14:32:07	2026-06-15 14:32:07
26	1	application_denied	Application denied	A final denied clearance decision was recorded for application 2026-0001.	App\\Models\\LandTransferApplication	1	{"application_id":1,"application_code":"2026-0001","status":"denied","status_label":"Denied","transferor_name":"Jake Cuenca","transferee_name":"Janus Espartero","municipality":null,"barangay":null}	2026-06-15 14:32:23	2026-06-15 14:32:07	2026-06-15 14:32:23
33	2	application_created	Clearance application encoded	Application 2026-0002 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","municipality":null,"barangay":null}	\N	2026-06-15 15:03:41	2026-06-15 15:03:41
34	3	application_created	Clearance application encoded	Application 2026-0002 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","municipality":null,"barangay":null}	\N	2026-06-15 15:03:41	2026-06-15 15:03:41
35	4	application_created	Clearance application encoded	Application 2026-0002 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","municipality":null,"barangay":null}	\N	2026-06-15 15:03:41	2026-06-15 15:03:41
36	5	application_created	Clearance application encoded	Application 2026-0002 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","municipality":null,"barangay":null}	\N	2026-06-15 15:03:41	2026-06-15 15:03:41
38	2	application_status_updated	Application status updated	Application 2026-0002 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 22:04:34	2026-06-15 22:04:34
39	3	application_status_updated	Application status updated	Application 2026-0002 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 22:04:34	2026-06-15 22:04:34
40	4	application_status_updated	Application status updated	Application 2026-0002 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 22:04:34	2026-06-15 22:04:34
41	5	application_status_updated	Application status updated	Application 2026-0002 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-15 22:04:34	2026-06-15 22:04:34
42	6	landowner_application_status	Application status updated	Your clearance application 2026-0002 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","status":"endorsed_lti","status_label":"Endorsed to LTI Division","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","municipality":null,"barangay":null}	\N	2026-06-15 22:04:34	2026-06-15 22:04:34
32	1	application_created	Clearance application encoded	Application 2026-0002 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Janus Espartero","transferee_name":"Jake Cuenca","municipality":null,"barangay":null}	2026-06-15 23:55:29	2026-06-15 15:03:41	2026-06-15 23:55:29
37	1	application_status_updated	Application status updated	Application 2026-0002 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	2	{"application_id":2,"application_code":"2026-0002","old_status":"pending_legal_review","new_status":"endorsed_lti"}	2026-06-15 23:55:29	2026-06-15 22:04:34	2026-06-15 23:55:29
43	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-001 was updated and is available for review.	App\\Models\\Parcel	1	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:35:53	2026-06-16 20:35:53
44	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-001 was updated and is available for review.	App\\Models\\Parcel	1	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:35:59	2026-06-16 20:35:59
45	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-001 was updated and is available for review.	App\\Models\\Parcel	1	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:36:44	2026-06-16 20:36:44
46	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-001 was updated and is available for review.	App\\Models\\Parcel	1	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:37:24	2026-06-16 20:37:24
47	2	geodetic_reference_available	Source reference available for review	Source package SRC-PKG-20260616204751-NYHU is available for parcel/reference review.	App\\Models\\SourceRecordPackage	1	{"package_code":"SRC-PKG-20260616204751-NYHU","parcel_code":"PARCEL-BANGA-001","status":"linked"}	\N	2026-06-16 20:47:51	2026-06-16 20:47:51
49	3	application_created	Clearance application encoded	Application 2026-0003 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:51:59	2026-06-16 20:51:59
50	4	application_created	Clearance application encoded	Application 2026-0003 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:51:59	2026-06-16 20:51:59
51	5	application_created	Clearance application encoded	Application 2026-0003 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 20:51:59	2026-06-16 20:51:59
53	3	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-16 20:57:56	2026-06-16 20:57:56
54	4	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-16 20:57:56	2026-06-16 20:57:56
55	5	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"pending_legal_review","new_status":"endorsed_lti"}	\N	2026-06-16 20:57:56	2026-06-16 20:57:56
57	3	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-16 20:58:08	2026-06-16 20:58:08
58	4	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-16 20:58:08	2026-06-16 20:58:08
59	5	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	\N	2026-06-16 20:58:08	2026-06-16 20:58:08
61	3	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-16 20:59:15	2026-06-16 20:59:15
62	4	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-16 20:59:15	2026-06-16 20:59:15
63	5	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	\N	2026-06-16 20:59:15	2026-06-16 20:59:15
65	3	application_status_updated	Application status updated	Application 2026-0003 is now For Releasing.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-16 20:59:19	2026-06-16 20:59:19
66	4	application_status_updated	Application status updated	Application 2026-0003 is now For Releasing.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-16 20:59:19	2026-06-16 20:59:19
67	5	application_status_updated	Application status updated	Application 2026-0003 is now For Releasing.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_parpo","new_status":"for_releasing"}	\N	2026-06-16 20:59:19	2026-06-16 20:59:19
69	3	application_released	Clearance released	A final released clearance decision was recorded for application 2026-0003.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"released","status_label":"Released","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 21:07:10	2026-06-16 21:07:10
70	4	application_released	Clearance released	A final released clearance decision was recorded for application 2026-0003.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"released","status_label":"Released","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 21:07:10	2026-06-16 21:07:10
71	5	application_released	Clearance released	A final released clearance decision was recorded for application 2026-0003.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"released","status_label":"Released","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-16 21:07:10	2026-06-16 21:07:10
48	1	application_created	Clearance application encoded	Application 2026-0003 was encoded and placed under Pending Review by Legal Officer.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"pending_legal_review","status_label":"Pending Review by Legal Officer","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	2026-06-16 21:09:26	2026-06-16 20:51:59	2026-06-16 21:09:26
52	1	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to LTI Division.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"pending_legal_review","new_status":"endorsed_lti"}	2026-06-16 21:09:26	2026-06-16 20:57:56	2026-06-16 21:09:26
56	1	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to Chief Legal.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_lti","new_status":"endorsed_chief_legal"}	2026-06-16 21:09:26	2026-06-16 20:58:08	2026-06-16 21:09:26
60	1	application_status_updated	Application status updated	Application 2026-0003 is now Endorsed to PARPO II.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_chief_legal","new_status":"endorsed_parpo"}	2026-06-16 21:09:26	2026-06-16 20:59:15	2026-06-16 21:09:26
64	1	application_status_updated	Application status updated	Application 2026-0003 is now For Releasing.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","old_status":"endorsed_parpo","new_status":"for_releasing"}	2026-06-16 21:09:26	2026-06-16 20:59:19	2026-06-16 21:09:26
68	1	application_released	Clearance released	A final released clearance decision was recorded for application 2026-0003.	App\\Models\\LandTransferApplication	3	{"application_id":3,"application_code":"2026-0003","status":"released","status_label":"Released","transferor_name":"Juan Reyes Dela Cruz","transferee_name":"Roberto Garcia","municipality":"Bayawan City","barangay":"Banga"}	2026-06-16 21:09:26	2026-06-16 21:07:10	2026-06-16 21:09:26
72	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-001 was updated and is available for review.	App\\Models\\Parcel	1	{"parcel_id":1,"parcel_code":"PARCEL-BANGA-001","municipality":"Bayawan City","barangay":"Banga"}	\N	2026-06-17 15:03:45	2026-06-17 15:03:45
73	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-002 was updated and is available for review.	App\\Models\\Parcel	2	{"parcel_id":2,"parcel_code":"PARCEL-BANGA-002","municipality":null,"barangay":null}	\N	2026-06-17 15:05:54	2026-06-17 15:05:54
74	2	geodetic_reference_updated	Parcel reference updated	Parcel reference PARCEL-BANGA-002 was updated and is available for review.	App\\Models\\Parcel	2	{"parcel_id":2,"parcel_code":"PARCEL-BANGA-002","municipality":null,"barangay":null}	\N	2026-06-17 15:06:46	2026-06-17 15:06:46
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dar_admin
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, is_active) FROM stdin;
1	DAR Staff Tester	staff.tester@dar-ltcms.local	2026-06-15 11:18:20	$2y$12$pC.NCq2S3S4sFMYw0tdvzeMx8fJqkDx/2aRVjksYVoDdkMIVadItm	\N	2026-06-15 11:18:20	2026-06-15 11:18:20	staff	t
3	Miles	miles.staff@dar-ltcms.local	2026-06-15 11:18:20	$2y$12$pC.NCq2S3S4sFMYw0tdvzeMx8fJqkDx/2aRVjksYVoDdkMIVadItm	\N	2026-06-15 11:18:20	2026-06-15 11:18:20	staff	t
4	Vea	vea.staff@dar-ltcms.local	2026-06-15 11:18:20	$2y$12$pC.NCq2S3S4sFMYw0tdvzeMx8fJqkDx/2aRVjksYVoDdkMIVadItm	\N	2026-06-15 11:18:20	2026-06-15 11:18:20	staff	t
5	Lloyd	lloyd.staff@dar-ltcms.local	2026-06-15 11:18:20	$2y$12$pC.NCq2S3S4sFMYw0tdvzeMx8fJqkDx/2aRVjksYVoDdkMIVadItm	\N	2026-06-15 11:18:20	2026-06-15 11:18:20	staff	t
6	Jake Cuenca	jake.landowner@gmail.com	\N	$2y$12$dr/p8KyUeyjLl3ex2G8wUe898dv8SGcUOST0JQ5pRZfydyoN5rcgC	qCm8ZpGjO2wHg33IlB21sYM4uogIVeo4Klsys5ulXnWxmuecIeOzaP9KlGG3	2026-06-15 13:46:55	2026-06-15 22:10:20	landowner	t
2	Jay	jay.staff@dar-ltcms.local	2026-06-15 11:18:20	$2y$12$pC.NCq2S3S4sFMYw0tdvzeMx8fJqkDx/2aRVjksYVoDdkMIVadItm	\N	2026-06-15 11:18:20	2026-06-15 22:11:48	geodetic	t
\.


--
-- Name: application_clearances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.application_clearances_id_seq', 2, true);


--
-- Name: application_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.application_documents_id_seq', 18, true);


--
-- Name: application_parcels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.application_parcels_id_seq', 1, true);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 54, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: land_transfer_applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.land_transfer_applications_id_seq', 3, true);


--
-- Name: landholding_mutations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.landholding_mutations_id_seq', 1, false);


--
-- Name: landholdings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.landholdings_id_seq', 1, true);


--
-- Name: landowners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.landowners_id_seq', 6, true);


--
-- Name: legacy_record_import_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.legacy_record_import_batches_id_seq', 1, false);


--
-- Name: legacy_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.legacy_records_id_seq', 3, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 43, true);


--
-- Name: parcels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.parcels_id_seq', 2, true);


--
-- Name: required_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.required_documents_id_seq', 18, true);


--
-- Name: source_record_package_import_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.source_record_package_import_batches_id_seq', 1, false);


--
-- Name: source_record_packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.source_record_packages_id_seq', 1, true);


--
-- Name: system_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.system_notifications_id_seq', 74, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dar_admin
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: application_clearances application_clearances_clearance_number_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_clearances
    ADD CONSTRAINT application_clearances_clearance_number_unique UNIQUE (clearance_number);


--
-- Name: application_clearances application_clearances_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_clearances
    ADD CONSTRAINT application_clearances_pkey PRIMARY KEY (id);


--
-- Name: application_documents application_documents_land_transfer_application_id_required_doc; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_land_transfer_application_id_required_doc UNIQUE (land_transfer_application_id, required_document_id);


--
-- Name: application_documents application_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_pkey PRIMARY KEY (id);


--
-- Name: application_parcels application_parcels_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_parcels
    ADD CONSTRAINT application_parcels_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: land_transfer_applications land_transfer_applications_application_code_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_application_code_unique UNIQUE (application_code);


--
-- Name: land_transfer_applications land_transfer_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_pkey PRIMARY KEY (id);


--
-- Name: landholding_mutations landholding_mutations_land_transfer_application_id_parcel_id_un; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_land_transfer_application_id_parcel_id_un UNIQUE (land_transfer_application_id, parcel_id);


--
-- Name: landholding_mutations landholding_mutations_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_pkey PRIMARY KEY (id);


--
-- Name: landholdings landholdings_landowner_id_parcel_id_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholdings
    ADD CONSTRAINT landholdings_landowner_id_parcel_id_unique UNIQUE (landowner_id, parcel_id);


--
-- Name: landholdings landholdings_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholdings
    ADD CONSTRAINT landholdings_pkey PRIMARY KEY (id);


--
-- Name: landowners landowners_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landowners
    ADD CONSTRAINT landowners_pkey PRIMARY KEY (id);


--
-- Name: landowners landowners_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landowners
    ADD CONSTRAINT landowners_user_id_unique UNIQUE (user_id);


--
-- Name: legacy_record_import_batches legacy_record_import_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_record_import_batches
    ADD CONSTRAINT legacy_record_import_batches_pkey PRIMARY KEY (id);


--
-- Name: legacy_records legacy_records_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records
    ADD CONSTRAINT legacy_records_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: parcels parcels_parcel_code_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.parcels
    ADD CONSTRAINT parcels_parcel_code_unique UNIQUE (parcel_code);


--
-- Name: parcels parcels_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.parcels
    ADD CONSTRAINT parcels_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: required_documents required_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.required_documents
    ADD CONSTRAINT required_documents_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: source_record_package_import_batches source_record_package_import_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_package_import_batches
    ADD CONSTRAINT source_record_package_import_batches_pkey PRIMARY KEY (id);


--
-- Name: source_record_packages source_record_packages_package_code_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages
    ADD CONSTRAINT source_record_packages_package_code_unique UNIQUE (package_code);


--
-- Name: source_record_packages source_record_packages_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages
    ADD CONSTRAINT source_record_packages_pkey PRIMARY KEY (id);


--
-- Name: system_notifications system_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.system_notifications
    ADD CONSTRAINT system_notifications_pkey PRIMARY KEY (id);


--
-- Name: application_clearances uq_application_clearances_application; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_clearances
    ADD CONSTRAINT uq_application_clearances_application UNIQUE (land_transfer_application_id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: app_docs_application_idx; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX app_docs_application_idx ON public.application_documents USING btree (land_transfer_application_id);


--
-- Name: app_parcels_application_idx; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX app_parcels_application_idx ON public.application_parcels USING btree (land_transfer_application_id);


--
-- Name: app_parcels_parcel_idx; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX app_parcels_parcel_idx ON public.application_parcels USING btree (parcel_id);


--
-- Name: application_documents_reference_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX application_documents_reference_number_index ON public.application_documents USING btree (document_reference_number);


--
-- Name: application_parcels_parcel_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX application_parcels_parcel_id_index ON public.application_parcels USING btree (parcel_id);


--
-- Name: audit_logs_action_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX audit_logs_action_index ON public.audit_logs USING btree (action);


--
-- Name: audit_logs_auditable_type_auditable_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX audit_logs_auditable_type_auditable_id_index ON public.audit_logs USING btree (auditable_type, auditable_id);


--
-- Name: audit_logs_created_at_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX audit_logs_created_at_index ON public.audit_logs USING btree (created_at);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: idx_application_clearances_status_generated; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX idx_application_clearances_status_generated ON public.application_clearances USING btree (decision_status, generated_at);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: landholding_mutations_transferor_landowner_id_transferee_landow; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX landholding_mutations_transferor_landowner_id_transferee_landow ON public.landholding_mutations USING btree (transferor_landowner_id, transferee_landowner_id);


--
-- Name: landholdings_landowner_status_idx; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX landholdings_landowner_status_idx ON public.landholdings USING btree (landowner_id, status);


--
-- Name: landholdings_parcel_idx; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX landholdings_parcel_idx ON public.landholdings USING btree (parcel_id);


--
-- Name: landowners_last_name_first_name_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX landowners_last_name_first_name_index ON public.landowners USING btree (last_name, first_name);


--
-- Name: legacy_record_import_batches_record_type_status_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_record_import_batches_record_type_status_index ON public.legacy_record_import_batches USING btree (record_type, status);


--
-- Name: legacy_records_control_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_control_number_index ON public.legacy_records USING btree (control_number);


--
-- Name: legacy_records_landowner_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_landowner_id_index ON public.legacy_records USING btree (landowner_id);


--
-- Name: legacy_records_lot_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_lot_number_index ON public.legacy_records USING btree (lot_number);


--
-- Name: legacy_records_municipality_barangay_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_municipality_barangay_index ON public.legacy_records USING btree (municipality, barangay);


--
-- Name: legacy_records_record_type_origin_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_record_type_origin_index ON public.legacy_records USING btree (record_type, origin);


--
-- Name: legacy_records_source_record_package_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_source_record_package_id_index ON public.legacy_records USING btree (source_record_package_id);


--
-- Name: legacy_records_tax_declaration_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_tax_declaration_number_index ON public.legacy_records USING btree (tax_declaration_number);


--
-- Name: legacy_records_title_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX legacy_records_title_number_index ON public.legacy_records USING btree (title_number);


--
-- Name: legacy_records_unique_control_number; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE UNIQUE INDEX legacy_records_unique_control_number ON public.legacy_records USING btree (record_type, lower((control_number)::text)) WHERE ((control_number IS NOT NULL) AND ((record_type)::text = 'historical_clearance'::text));


--
-- Name: legacy_records_unique_title_number; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE UNIQUE INDEX legacy_records_unique_title_number ON public.legacy_records USING btree (record_type, lower((title_number)::text)) WHERE ((title_number IS NOT NULL) AND ((record_type)::text = 'title'::text));


--
-- Name: parcels_municipality_barangay_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX parcels_municipality_barangay_index ON public.parcels USING btree (municipality, barangay);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: source_record_package_import_batches_status_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_package_import_batches_status_index ON public.source_record_package_import_batches USING btree (status);


--
-- Name: source_record_packages_control_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_control_number_index ON public.source_record_packages USING btree (control_number);


--
-- Name: source_record_packages_landholding_reference_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_landholding_reference_number_index ON public.source_record_packages USING btree (landholding_reference_number);


--
-- Name: source_record_packages_landowner_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_landowner_id_index ON public.source_record_packages USING btree (landowner_id);


--
-- Name: source_record_packages_parcel_code_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_parcel_code_index ON public.source_record_packages USING btree (parcel_code);


--
-- Name: source_record_packages_parcel_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_parcel_id_index ON public.source_record_packages USING btree (parcel_id);


--
-- Name: source_record_packages_status_source_record_scope_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_status_source_record_scope_index ON public.source_record_packages USING btree (status, source_record_scope);


--
-- Name: source_record_packages_title_number_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX source_record_packages_title_number_index ON public.source_record_packages USING btree (title_number);


--
-- Name: system_notifications_read_at_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX system_notifications_read_at_index ON public.system_notifications USING btree (read_at);


--
-- Name: system_notifications_related_type_related_id_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX system_notifications_related_type_related_id_index ON public.system_notifications USING btree (related_type, related_id);


--
-- Name: system_notifications_type_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX system_notifications_type_index ON public.system_notifications USING btree (type);


--
-- Name: system_notifications_user_id_created_at_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX system_notifications_user_id_created_at_index ON public.system_notifications USING btree (user_id, created_at);


--
-- Name: system_notifications_user_id_read_at_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX system_notifications_user_id_read_at_index ON public.system_notifications USING btree (user_id, read_at);


--
-- Name: users_is_active_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX users_is_active_index ON public.users USING btree (is_active);


--
-- Name: users_role_index; Type: INDEX; Schema: public; Owner: dar_admin
--

CREATE INDEX users_role_index ON public.users USING btree (role);


--
-- Name: application_clearances application_clearances_generated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_clearances
    ADD CONSTRAINT application_clearances_generated_by_foreign FOREIGN KEY (generated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: application_clearances application_clearances_land_transfer_application_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_clearances
    ADD CONSTRAINT application_clearances_land_transfer_application_id_foreign FOREIGN KEY (land_transfer_application_id) REFERENCES public.land_transfer_applications(id) ON DELETE CASCADE;


--
-- Name: application_documents application_documents_land_transfer_application_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_land_transfer_application_id_foreign FOREIGN KEY (land_transfer_application_id) REFERENCES public.land_transfer_applications(id) ON DELETE CASCADE;


--
-- Name: application_documents application_documents_metadata_encoded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_metadata_encoded_by_foreign FOREIGN KEY (metadata_encoded_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: application_documents application_documents_required_document_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_required_document_id_foreign FOREIGN KEY (required_document_id) REFERENCES public.required_documents(id) ON DELETE CASCADE;


--
-- Name: application_documents application_documents_source_record_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_source_record_id_foreign FOREIGN KEY (source_record_id) REFERENCES public.legacy_records(id) ON DELETE SET NULL;


--
-- Name: application_documents application_documents_source_record_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_source_record_package_id_foreign FOREIGN KEY (source_record_package_id) REFERENCES public.source_record_packages(id) ON DELETE SET NULL;


--
-- Name: application_documents application_documents_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_documents
    ADD CONSTRAINT application_documents_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: application_parcels application_parcels_land_transfer_application_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_parcels
    ADD CONSTRAINT application_parcels_land_transfer_application_id_foreign FOREIGN KEY (land_transfer_application_id) REFERENCES public.land_transfer_applications(id) ON DELETE CASCADE;


--
-- Name: application_parcels application_parcels_parcel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.application_parcels
    ADD CONSTRAINT application_parcels_parcel_id_foreign FOREIGN KEY (parcel_id) REFERENCES public.parcels(id) ON DELETE SET NULL;


--
-- Name: audit_logs audit_logs_actor_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_actor_user_id_foreign FOREIGN KEY (actor_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: audit_logs audit_logs_land_transfer_application_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_land_transfer_application_id_foreign FOREIGN KEY (land_transfer_application_id) REFERENCES public.land_transfer_applications(id) ON DELETE SET NULL;


--
-- Name: land_transfer_applications land_transfer_applications_encoded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_encoded_by_foreign FOREIGN KEY (encoded_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: land_transfer_applications land_transfer_applications_registry_mutated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_registry_mutated_by_foreign FOREIGN KEY (registry_mutated_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: land_transfer_applications land_transfer_applications_reviewed_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_reviewed_by_foreign FOREIGN KEY (reviewed_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: land_transfer_applications land_transfer_applications_transferee_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_transferee_landowner_id_foreign FOREIGN KEY (transferee_landowner_id) REFERENCES public.landowners(id) ON DELETE SET NULL;


--
-- Name: land_transfer_applications land_transfer_applications_transferor_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.land_transfer_applications
    ADD CONSTRAINT land_transfer_applications_transferor_landowner_id_foreign FOREIGN KEY (transferor_landowner_id) REFERENCES public.landowners(id) ON DELETE SET NULL;


--
-- Name: landholding_mutations landholding_mutations_land_transfer_application_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_land_transfer_application_id_foreign FOREIGN KEY (land_transfer_application_id) REFERENCES public.land_transfer_applications(id) ON DELETE CASCADE;


--
-- Name: landholding_mutations landholding_mutations_mutated_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_mutated_by_foreign FOREIGN KEY (mutated_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: landholding_mutations landholding_mutations_parcel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_parcel_id_foreign FOREIGN KEY (parcel_id) REFERENCES public.parcels(id) ON DELETE CASCADE;


--
-- Name: landholding_mutations landholding_mutations_transferee_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_transferee_landowner_id_foreign FOREIGN KEY (transferee_landowner_id) REFERENCES public.landowners(id) ON DELETE CASCADE;


--
-- Name: landholding_mutations landholding_mutations_transferor_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholding_mutations
    ADD CONSTRAINT landholding_mutations_transferor_landowner_id_foreign FOREIGN KEY (transferor_landowner_id) REFERENCES public.landowners(id) ON DELETE CASCADE;


--
-- Name: landholdings landholdings_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholdings
    ADD CONSTRAINT landholdings_landowner_id_foreign FOREIGN KEY (landowner_id) REFERENCES public.landowners(id) ON DELETE CASCADE;


--
-- Name: landholdings landholdings_parcel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholdings
    ADD CONSTRAINT landholdings_parcel_id_foreign FOREIGN KEY (parcel_id) REFERENCES public.parcels(id) ON DELETE CASCADE;


--
-- Name: landholdings landholdings_source_application_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landholdings
    ADD CONSTRAINT landholdings_source_application_id_foreign FOREIGN KEY (source_application_id) REFERENCES public.land_transfer_applications(id) ON DELETE SET NULL;


--
-- Name: landowners landowners_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.landowners
    ADD CONSTRAINT landowners_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: legacy_record_import_batches legacy_record_import_batches_committed_by_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_record_import_batches
    ADD CONSTRAINT legacy_record_import_batches_committed_by_user_id_foreign FOREIGN KEY (committed_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: legacy_record_import_batches legacy_record_import_batches_uploaded_by_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_record_import_batches
    ADD CONSTRAINT legacy_record_import_batches_uploaded_by_user_id_foreign FOREIGN KEY (uploaded_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: legacy_records legacy_records_encoded_by_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records
    ADD CONSTRAINT legacy_records_encoded_by_user_id_foreign FOREIGN KEY (encoded_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: legacy_records legacy_records_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records
    ADD CONSTRAINT legacy_records_landowner_id_foreign FOREIGN KEY (landowner_id) REFERENCES public.landowners(id) ON DELETE SET NULL;


--
-- Name: legacy_records legacy_records_legacy_record_import_batch_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records
    ADD CONSTRAINT legacy_records_legacy_record_import_batch_id_foreign FOREIGN KEY (legacy_record_import_batch_id) REFERENCES public.legacy_record_import_batches(id) ON DELETE SET NULL;


--
-- Name: legacy_records legacy_records_parcel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records
    ADD CONSTRAINT legacy_records_parcel_id_foreign FOREIGN KEY (parcel_id) REFERENCES public.parcels(id) ON DELETE SET NULL;


--
-- Name: legacy_records legacy_records_source_record_package_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.legacy_records
    ADD CONSTRAINT legacy_records_source_record_package_id_foreign FOREIGN KEY (source_record_package_id) REFERENCES public.source_record_packages(id) ON DELETE SET NULL;


--
-- Name: source_record_package_import_batches source_record_package_import_batches_committed_by_user_id_forei; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_package_import_batches
    ADD CONSTRAINT source_record_package_import_batches_committed_by_user_id_forei FOREIGN KEY (committed_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: source_record_package_import_batches source_record_package_import_batches_uploaded_by_user_id_foreig; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_package_import_batches
    ADD CONSTRAINT source_record_package_import_batches_uploaded_by_user_id_foreig FOREIGN KEY (uploaded_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: source_record_packages source_record_packages_encoded_by_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages
    ADD CONSTRAINT source_record_packages_encoded_by_user_id_foreign FOREIGN KEY (encoded_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: source_record_packages source_record_packages_landowner_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages
    ADD CONSTRAINT source_record_packages_landowner_id_foreign FOREIGN KEY (landowner_id) REFERENCES public.landowners(id) ON DELETE SET NULL;


--
-- Name: source_record_packages source_record_packages_parcel_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages
    ADD CONSTRAINT source_record_packages_parcel_id_foreign FOREIGN KEY (parcel_id) REFERENCES public.parcels(id) ON DELETE SET NULL;


--
-- Name: source_record_packages source_record_packages_source_file_uploaded_by_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.source_record_packages
    ADD CONSTRAINT source_record_packages_source_file_uploaded_by_user_id_foreign FOREIGN KEY (source_file_uploaded_by_user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: system_notifications system_notifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: dar_admin
--

ALTER TABLE ONLY public.system_notifications
    ADD CONSTRAINT system_notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO dar_admin;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO dar_admin;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO dar_admin;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO dar_admin;


--
-- PostgreSQL database dump complete
--

\unrestrict zAo7iY1mOhkBV94ZPbwjqQQMU9uJfiQewrdqTz3b67oRf6MuJjlxWtEzXtb1MrT


-- Creating the task_status table
CREATE TABLE task_status (
                             id serial PRIMARY KEY,
                             name varchar(256) NOT NULL
);

-- Inserting initial rows into task_status table
INSERT INTO task_status (name) VALUES ('unclaimed'), ('claimed'), ('completed'), ('failed');

-- Creating the task_type table
CREATE TABLE task_type (
                           id serial PRIMARY KEY,
                           name varchar(256) NOT NULL
);

-- Inserting initial rows into task_type table
INSERT INTO task_type (name) VALUES ('talkwalker'), ('twitter'), ('reddit'), ('edgar'), ('s3-ingestor'), ('pinecone-ingestor'), ('full-text-search-ingestor');

-- Creating the task_queue table
CREATE TABLE task_queue (
                            id SERIAL PRIMARY KEY,
                            query VARCHAR(256),
                            task_type_id INTEGER NOT NULL REFERENCES task_type(id),
                            claimed_time TIMESTAMP,
                            claimed_by_agent VARCHAR(256),
                            task_status_id INTEGER NOT NULL REFERENCES task_status(id),
                            message VARCHAR(2048),
                            completed_time TIMESTAMP,
                            failed_time TIMESTAMP,
                            original_documents_retrieved INTEGER DEFAULT 0,
                            text_documents_retrieved INTEGER DEFAULT 0,
                            requested_by_user VARCHAR(256),
                            notes VARCHAR(2048),
                            job_progress_metrics json,
                            object_storage_key_for_results VARCHAR(256),
                            parameter_checksum VARCHAR(256),
                            revision VARCHAR(256)
);
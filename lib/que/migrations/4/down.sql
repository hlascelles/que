DROP TRIGGER que_job_notify ON que_jobs;
DROP FUNCTION que_job_notify();
DROP TABLE que_lockers;

DROP INDEX que_jobs_poll_idx;

ALTER TABLE que_jobs
  RENAME COLUMN id TO job_id;

ALTER TABLE que_jobs
  DROP CONSTRAINT que_jobs_pkey,
  DROP COLUMN is_processed,
  ADD CONSTRAINT que_jobs_pkey PRIMARY KEY (queue, priority, run_at, job_id),
  DROP CONSTRAINT queue_length;

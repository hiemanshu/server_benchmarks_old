DROP TABLE IF EXISTS fortunes;

CREATE TABLE "fortunes" (
  "id" integer NOT NULL,
  "message" text NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO fortunes VALUES (1, 'fortune: No such file or directory');
INSERT INTO fortunes VALUES (2, 'A computer scientist is someone who fixes things that aren''t broken.');
INSERT INTO fortunes VALUES (3, 'After enough decimal places, nobody gives a damn.');
INSERT INTO fortunes VALUES (4, 'A bad random number generator: 1, 1, 1, 1, 1, 4.33e+67, 1, 1, 1');
INSERT INTO fortunes VALUES (5, 'A computer program does what you tell it to do, not what you want it to do.');
INSERT INTO fortunes VALUES (6, 'Emacs is a nice operating system, but I prefer UNIX. — Tom Christaensen');
INSERT INTO fortunes VALUES (7, 'Any program that runs right is obsolete.');
INSERT INTO fortunes VALUES (8, 'A list is only as strong as its weakest link. — Donald Knuth');
INSERT INTO fortunes VALUES (9, 'Feature: A bug with seniority.');
INSERT INTO fortunes VALUES (10, 'Computers make very fast, very accurate mistakes.');
INSERT INTO fortunes VALUES (11, '<script>alert("This should not be displayed in a browser alert box.");</script>');
INSERT INTO fortunes VALUES (12, 'フレームワークのベンチマーク');
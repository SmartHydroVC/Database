CREATE TABLE tent (
tentId      INT IDENTITY(1, 1),
[location]  VARCHAR(128),
ssid        VARCHAR(128),
)

CREATE TABLE sensor_readings (
readingId		INT        IDENTITY (1,1),
tentId          INT        NOT NULL,
temperature		DECIMAL(2) NULL,
humidity		DECIMAL(2) NULL,
ph				DECIMAL(2) NULL,
ec			    DECIMAL(2) NULL,
water_flow	    DECIMAL(2) NULL,
light_intensity DECIMAL(2) NULL,
[timestamp]		DATETIME   NOT NULL DEFAULT GETDATE(),
CONSTRAINT PK_sensor_readings PRIMARY KEY (readingId),
CONSTRAINT FK_sensor_readings_tent FOREIGN KEY (tentId) REFERENCES tent (tentId),
)

CREATE TABLE ai_events (
eventId		  INT         IDENTITY(1,1),
tentId        INT         NOT NULL,
[description] VARCHAR(64) NOT NULL,
[timestamp]   DATE		  NOT NULL DEFAULT GETDATE(),
CONSTRAINT PK_ai_events PRIMARY KEY (eventId),
CONSTRAINT FK_ai_events_tent FOREIGN KEY (tentId) REFERENCES tent (tentId),
)

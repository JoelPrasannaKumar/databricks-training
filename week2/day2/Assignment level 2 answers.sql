-- 1
SELECT
    emp_id,

    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS employee_name,

    CASE
        WHEN DAYNAME(login_time)
             IN ('Saturday','Sunday')
            THEN 'Weekend'

        ELSE 'Weekday'
    END AS day_type,

    ROUND(
        TIME_TO_SEC(
            TIMEDIFF(logout_time, login_time)
        ) / 3600,
        2
    ) AS working_hours,

    CASE
        WHEN DAYNAME(login_time)
             NOT IN ('Saturday','Sunday')
             AND (
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) >= 8
            THEN 'Good Performer'

        WHEN DAYNAME(login_time)
             NOT IN ('Saturday','Sunday')
             AND (
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) < 6
            THEN 'Bad Performer'

        ELSE 'Weekend Login'
    END AS performance_status

FROM employee_login;

-- 2
SELECT
    emp_id,

    UPPER(emp_name) AS employee_name,

    login_date,

    CASE
        WHEN DAYNAME(login_date)
             IN ('Saturday','Sunday')
            THEN 'Weekend'

        ELSE 'Weekday'
    END AS day_type,

    TIMEDIFF(logout_time, login_time) AS working_hours,

    CASE
        WHEN login_date >= CURDATE() - INTERVAL 7 DAY
             AND (
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) >= 8
            THEN 'Active & Productive'

        WHEN login_date >= CURDATE() - INTERVAL 7 DAY
             AND (
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) < 8
            THEN 'Active but Low Hours'

        ELSE 'Absent from Last 7 Days'
    END AS productivity_status

FROM attendance_log;

-- 3
SELECT
    emp_id,

    LOWER(emp_name) AS employee_name,

    DAYNAME(work_date) AS day_name,

    CEIL(
        TIME_TO_SEC(
            TIMEDIFF(logout_time, login_time)
        ) / 3600
    ) AS working_hours,

    CASE
        WHEN DAYNAME(work_date)
             IN ('Saturday','Sunday')
             AND CEIL(
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) >= 8
            THEN 'Weekend Overtime'

        WHEN DAYNAME(work_date)
             IN ('Saturday','Sunday')
             AND CEIL(
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) < 4
            THEN 'Suspicious Login'

        ELSE 'Normal Working Day'
    END AS work_status

FROM weekend_monitor;

-- 4
SELECT
    emp_id,

    emp_name,

    HOUR(login_datetime) AS login_hour,

    TRUNCATE(
        TIME_TO_SEC(
            TIMEDIFF(logout_datetime, login_datetime)
        ) / 3600,
        1
    ) AS working_hours,

    DAYNAME(login_datetime) AS weekday_name,

    CASE
        WHEN DAYNAME(login_datetime)
             NOT IN ('Saturday','Sunday')
             AND HOUR(login_datetime) < 9
             AND (
                    TIME_TO_SEC(
                        TIMEDIFF(
                            logout_datetime,
                            login_datetime
                        )
                    ) / 3600
                 ) >= 8
            THEN 'Disciplined'

        WHEN DAYNAME(login_datetime)
             NOT IN ('Saturday','Sunday')
             AND HOUR(login_datetime) > 10
            THEN 'Late Comer'

        ELSE 'Poor Discipline'
    END AS discipline_status

FROM login_discipline;

-- 5
SELECT
    emp_id,

    CONCAT(
        UPPER(LEFT(emp_name,1)),
        LOWER(SUBSTRING(emp_name,2))
    ) AS employee_name,

    work_date,

    CASE
        WHEN DAYNAME(work_date)
             IN ('Saturday','Sunday')
            THEN 'Weekend'

        ELSE 'Weekday'
    END AS day_type,

    FLOOR(
        TIME_TO_SEC(
            TIMEDIFF(logout_time, login_time)
        ) / 3600
    ) AS total_hours,

    CASE
        WHEN work_date >= CURDATE() - INTERVAL 7 DAY
             AND DAYNAME(work_date)
                 NOT IN ('Saturday','Sunday')
             AND FLOOR(
                    TIME_TO_SEC(
                        TIMEDIFF(logout_time, login_time)
                    ) / 3600
                 ) >= 8
            THEN 'Consistent Performer'

        WHEN FLOOR(
                TIME_TO_SEC(
                    TIMEDIFF(logout_time, login_time)
                ) / 3600
             ) < 6
            THEN 'Irregular Performer'

        ELSE 'Absent / Old Record'
    END AS performance_status

FROM performance_tracker;

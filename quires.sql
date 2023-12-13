CREATE VIEW All_popular_courses as
SELECT
    courses.*,
    category.cat_name_en,
    category.cat_name_ar,
    mentors.name AS "Mentor_name"
FROM
    courses
    INNER JOIN category ON category.cat_ID = courses.cat_ID
    INNER JOIN mentors on mentors.ID = courses.mentor_id
ORDER BY
    students_count DESC
LIMIT
    6 -------------------------------
    CREATE VIEW popular_mentors as
SELECT
    *
FROM
    mentors
ORDER BY
    rating_count DESC
LIMIT
    6 ------------------------------------
SELECT
    courses.*,
    category.cat_name_en,
    category.cat_name_ar
FROM
    courses
    INNER JOIN category ON category.cat_ID = courses.cat_ID
WHERE
    category.cat_name_en = "3D_Design";
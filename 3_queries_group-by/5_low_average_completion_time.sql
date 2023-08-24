SELECT students.name AS student, 
SUM(assignment_submissions.duration)/COUNT(assignment_submissions.*) AS average_assignment_duration,
SUM(assignments.duration)/COUNT(assignments.*) AS average_estimated_duration
FROM students
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING SUM(assignment_submissions.duration)/COUNT(assignment_submissions.*) < SUM(assignments.duration)/COUNT(assignments.*)
ORDER BY SUM(assignment_submissions.duration)/COUNT(assignment_submissions.*);
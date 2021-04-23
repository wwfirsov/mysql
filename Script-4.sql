-- 3. ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?   

SELECT gender FROM (
	SELECT "m" as gender, COUNT(*) as total FROM likes WHERE user_id IN (SELECT user_id FROM profiles as p WHERE gender='m')
	UNION
	SELECT "f" as gender, COUNT(*) as total FROM likes WHERE user_id IN (SELECT user_id FROM profiles as p WHERE gender='f')
) as my_sort
ORDER BY total DESC
LIMIT 1;

-- 4. ���������� ����� ���������� ������ ������ ����� ������� ������������� (������� ������ �������� 10 ����� ������� �������������).

SELECT count(*) as total_likes FROM media as m WHERE id IN (
	SELECT id FROM media 
	WHERE user_id IN (
		SELECT * FROM (
			SELECT user_id FROM profiles ORDER by birthday DESC LIMIT 10
		) as user_id		
	)
);

-- 5. ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����

(SELECT id,0 as activite FROM users WHERE id NOT IN (SELECT user_id FROM likes GROUP by user_id))
UNION
(SELECT user_id as id, COUNT(*) as activite FROM likes GROUP by user_id)
LIMIT 10;

-- !!! ������� �������� �������� �� ������� �� ����� - ��������� ���, ���������� �� ������������ � ������������� ����������� ������� ������������� �����������.




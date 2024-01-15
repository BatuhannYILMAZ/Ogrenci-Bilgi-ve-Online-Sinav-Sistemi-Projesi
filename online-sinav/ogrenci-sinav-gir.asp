<%
Response.CodePage = 65001
Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Sınav Sistemi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .question-table {
            margin: 0 auto;
            width: 80%;
            max-width: 800px;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .question-table th,
        .question-table td {
            padding: 10px;
            text-align: left;
        }

        .question-table th {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        .question-table td label {
            display: block;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #f0f0f0;
            color: #333;
            border: 2px solid #ccc;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .question-table td label:hover {
            background-color: #e0e0e0;
        }

        .question-table td input[type="radio"] {
            display: none;
        }

        .question-table td input[type="radio"]:checked + label {
            background-color: #4caf50;
            color: #fff;
            border-color: #4caf50;
        }

        .submit-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .submit-button button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .submit-button button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <% 

    ders_kodu=Request.QueryString("ders_kodu")
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../vt/SORU.mdb")
    
    If Session("current_question") = "" Then
        ' Retrieve all question IDs from the database
        Set rsAll = conn.Execute("SELECT id FROM " & ders_kodu)
        questionIDs = ""

        Do Until rsAll.EOF
            questionIDs = questionIDs & rsAll("id") & ","
            rsAll.MoveNext
        Loop
        rsAll.Close

        ' Shuffle the question IDs
        questionIDs = Split(Left(questionIDs, Len(questionIDs)-1), ",")
        Randomize
        For i = 0 To UBound(questionIDs)
            randomIndex = Int((UBound(questionIDs) - i + 1) * Rnd() + i)
            temp = questionIDs(i)
            questionIDs(i) = questionIDs(randomIndex)
            questionIDs(randomIndex) = temp
        Next

        ' Store the shuffled question IDs in the session
        Session("question_ids") = questionIDs

        ' Set the initial current question index
        Session("current_question") = 0
    Else
        Session("current_question") = Session("current_question") + 1
    End If

    ' Retrieve the current question ID from the shuffled question IDs
    currentQuestionIndex = Session("current_question")
    questionIDs = Session("question_ids")
    If currentQuestionIndex > UBound(questionIDs) Then
        ' All questions have been answered
        Session("current_question") = ""
        Response.Redirect("puan_insert.asp?ders_kodu=" & ders_kodu)
    Else
        currentQuestionID = questionIDs(currentQuestionIndex)
        Set rs = conn.Execute("SELECT * FROM " & ders_kodu & " WHERE id = " & currentQuestionID)
    End If
    %>
    <h1>Sınav</h1>
    <form action="cevap_kontrol.asp" method="post">
        <input type="hidden" value="<%=ders_kodu%>" name="ders_kodu">
        <input type="hidden" value="<%=currentQuestionID%>" name="soru_id">
        <table class="question-table">
            <tr>
                <th>Soru</th>
            </tr>
            <tr>
                <td><%= rs("Soru") %></td>
            </tr>
            <% Dim answerChoices(4)
            answerChoices(0) = rs("SecenekA")
            answerChoices(1) = rs("SecenekB")
            answerChoices(2) = rs("SecenekC")
            answerChoices(3) = rs("SecenekD")
            Randomize
            For i = 0 To 3
                randomIndex = Int((3 - i + 1) * Rnd() + i)
                temp = answerChoices(i)
                answerChoices(i) = answerChoices(randomIndex)
                answerChoices(randomIndex) = temp
            Next %>
            <tr>
                <td>
                    <input type="radio" name="secenek" id="secenekA" value="<%= answerChoices(0) %>">
                    <label for="secenekA"><%= answerChoices(0) %></label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="secenek" id="secenekB" value="<%= answerChoices(1) %>">
                    <label for="secenekB"><%= answerChoices(1) %></label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="secenek" id="secenekC" value="<%= answerChoices(2) %>">
                    <label for="secenekC"><%= answerChoices(2) %></label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="secenek" id="secenekD" value="<%= answerChoices(3) %>">
                    <label for="secenekD"><%= answerChoices(3) %></label>
                </td>
            </tr>
        </table>

        <div class="submit-button">
                <button type="submit">Sonraki Soru</button>
        </div>
    </form>

</body>
</html>





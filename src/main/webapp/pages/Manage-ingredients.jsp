<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Taste of Nepal - Ingredients Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style>

        main {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .container {
            margin-bottom: 30px;
        }

        h2 {
            margin-bottom: 15px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            background-color: #dde1e7;
            border: none;
            border-radius: 3px;
        }

        .ingredient-row {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }

        .ingredient-row .form-group {
            flex: 1;
        }

        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-weight: 500;
        }

        .btn-primary {
            background-color: #478c21;
            color: white;
        }

        .btn-secondary {
            background-color: #f0f0f0;
            color: #333;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 0.9em;
        }

        /* Ingredients List */
        .ingredients-list {
            margin-top: 30px;
            background-color: white;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .ingredients-table {
            width: 100%;
            border-collapse: collapse;
        }

        .ingredients-table th,
        .ingredients-table td {
            padding: 10px 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .ingredients-table th {
            background-color: #f8f8f8;
        }

        .action-btns {
            display: flex;
            gap: 5px;
        }

        /* Alert Messages */
        .alert {
            padding: 10px 15px;
            border-radius: 3px;
            margin-bottom: 15px;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <main>
        <div id="alertContainer"></div>
        
        <div class="container">
            <h2>Manage Ingredients</h2>
            <form id="ingredientForm">
                <input type="hidden" id="ingredientId" value="">
                
                <div class="form-group">
                    <label for="ingredientName">Ingredient Name</label>
                    <input type="text" id="ingredientName" class="form-control" required>
                </div>
                
            
                
              
                
                <div class="form-group">
                    <button type="submit" id="saveBtn" class="btn btn-primary">Add Ingredient</button>
                    <button type="button" id="cancelBtn" class="btn btn-secondary" style="display: none;">Cancel</button>
                </div>
            </form>
        </div>
        
        <div class="ingredients-list">
            <h2>Ingredients List</h2>
            <table class="ingredients-table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Unit</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="ingredientsTableBody">
                    <!-- Ingredients will be dynamically added here -->
                </tbody>
            </table>
        </div>
    </main>

</body>
</html>
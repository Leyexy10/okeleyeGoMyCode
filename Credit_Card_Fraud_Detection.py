import streamlit as st  # For building the Streamlit app
import pandas as pd  # For data manipulation
import numpy as np  # For numerical computations
import matplotlib.pyplot as plt  # For visualizations
import seaborn as sns  # For advanced data visualization
from sklearn.model_selection import train_test_split  # For splitting data into training and testing sets
from sklearn.ensemble import RandomForestClassifier  # For the Random Forest model
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report, roc_auc_score  # For model evaluation
from sklearn.preprocessing import StandardScaler, OneHotEncoder, LabelEncoder  # For data preprocessing

# Set up Streamlit App title
st.title("Credit Card Fraud Detection App")
st.write("Enter the following features to detect if the transaction is Not_fraud or fraud:")

# Load data
df = pd.read_csv("Desktop/GMC/fraud_dataset.csv", delimiter="\t")

# Check column names
st.write("Columns in the dataset:", df.columns)

# Strip any leading/trailing spaces from column names
df.columns = df.columns.str.strip()

# Ensure 'Class' column exists
if 'Class' in df.columns:
    # Separate Not_fraud and fraud transactions
    Not_fraud = df[df['Class'] == 0]
    fraud = df[df['Class'] == 1]

    # Sample Not_fraud transactions to balance the dataset
    Not_fraud_sample = Not_fraud.sample(n=492)
    df_balanced = pd.concat([Not_fraud_sample, fraud], axis=0)

    # Dropping irrelevant columns and setting up feature and target variables
    columns_to_drop = ['Class', 'V8', 'V20', 'V21', 'V27', 'V28', 'V13', 'V22', 'V23', 'V24', 'V25', 'V26', 'V6', 'Time', 'Amount']
    X = df_balanced.drop(columns=columns_to_drop, axis=1)
    y = df_balanced['Class']

    # Splitting data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)

    # Model Selection and Training
    model = RandomForestClassifier(n_estimators=269, max_depth=20, min_samples_split=5, min_samples_leaf=1, bootstrap=False, random_state=42)
    model.fit(X_train, y_train)

    # Making Predictions
    y_pred = model.predict(X_test)

    # Model Evaluation
    accuracy = accuracy_score(y_test, y_pred)
    st.write(f'Accuracy: {accuracy * 100:.2f}%')
    st.write("Confusion Matrix:", confusion_matrix(y_test, y_pred))
    st.write("Classification Report:", classification_report(y_test, y_pred))
    st.write('ROC-AUC Score:', roc_auc_score(y_test, y_pred))

    # User Input for Prediction using st.number_input
    st.write("Enter feature values below to predict if a transaction is fraud or not.")

    
    # Create a dictionary to store user inputs
    user_inputs = {}
    
    for col in feature_columns:
        user_inputs[col] = st.number_input(f'Enter {col}', value=0.0, format="%.6f")
    
    # Convert user input values into a numpy array
    input_features = np.array([user_inputs[col] for col in feature_columns]).reshape(1, -1)
    
    # Create a button to submit input and get prediction
    submit = st.button('Submit')

    if submit:
        # Make prediction
        prediction = model.predict(input_features)

        # Output the prediction
        if prediction[0] == 0:
            st.write("Not_fraud")
        else:
            st.write("fraud")

else:
    st.write("Error: 'Class' column not found in the dataset.")


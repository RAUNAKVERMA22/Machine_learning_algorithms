# Support Vector Machine on Iris Dataset

# 1. Import libraries


import matplotlib.pyplot as plt
import seaborn as sns
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix

# 2. Load the dataset
iris = datasets.load_iris()
X = iris.data   # features (sepal length, sepal width, petal length, petal width)
y = iris.target # labels (setosa, versicolor, virginica)

# 3. Split into training & test data
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42
)

# 4. Train the SVM model
model = SVC(kernel='linear', C=1.0)  # Linear kernel
model.fit(X_train, y_train)

# 5. Make predictions
y_pred = model.predict(X_test)

# 6. Evaluate the model
print("Confusion Matrix:\n", confusion_matrix(y_test, y_pred))
print("\nClassification Report:\n", classification_report(y_test, y_pred, target_names=iris.target_names))

# 7. Visualize with seaborn (Confusion Matrix Heatmap)
plt.figure(figsize=(6,4))
sns.heatmap(confusion_matrix(y_test, y_pred), annot=True, cmap="Blues", fmt="d",
            xticklabels=iris.target_names, yticklabels=iris.target_names)
plt.xlabel("Predicted")
plt.ylabel("Actual")
plt.title("SVM Confusion Matrix on Iris Dataset")
plt.show()

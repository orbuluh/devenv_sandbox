#include <Eigen/Dense>
#include <iostream>

int main() {
  // Define the matrix of independent variables X (features)
  Eigen::MatrixXd X(5,
                    2);  // 5 samples, 2 features (including the intercept term)
  X << 1, 1, 1, 2, 1, 3, 1, 4, 1, 5;

  // Define the vector of dependent variables Y (observed outcomes)
  Eigen::VectorXd Y(5);
  Y << 1.2, 2.3, 2.9, 3.7, 4.1;

  // OLS estimate using the formula: β = (X^T X)^{-1} X^T Y
  Eigen::VectorXd beta = (X.transpose() * X).inverse() * X.transpose() * Y;

  // Output the results
  std::cout << "Estimated Coefficients (beta): \n" << beta << std::endl;

  return 0;
}
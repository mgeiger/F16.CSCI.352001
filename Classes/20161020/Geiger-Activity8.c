#include <stdio.h>

// Function to prompt user for side length
//
// Input: The number of sides to ask the user for
// Ouput: The total perimeter of the object
int calculate_perimeter(int sides) {
	int total_value = 0;
	int input_value;
	int i;

	// Loop to ask for side length and add to total
	for (i = 0; i < sides; i++) {
		printf("Enter side %d: ", i+1);
		scanf("%d", &input_value);
		total_value += input_value;
		printf("\n");
	}
	
	return total_value;
}

int main() {
    // The input from the user for Rect or Tri
	int input;
    // The perimeter that we will be displaying
	int perimeter;

	printf("Enter 1 for Rect, 2 for Tri: ");
	scanf("%d", &input);

	printf("\nYou entered: %d", input);
	printf("\n");	

	switch(input) {
		case 1:
			// The Rectangle Calculation
			printf("You are doing a Rect.\n");
            // TODO: Don't just randomly have a constant
			perimeter = calculate_perimeter(4);
			printf("Your perimeter is %d.\n", perimeter);
			break;
		case 2:
			// The Triangle calculation
			printf("You are doing a Tri.\n");
			// TODO: Don't just randomly have a constant
            perimeter = calculate_perimeter(3);
			printf("Your perimeter is %d.\n", perimeter);
			break;
		default:
			// Default to a Failure
			printf("You entered a wrong value.\n");
			break;
	}

	return 0;
}



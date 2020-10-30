const grades = [73, 69, 3, 100, 50, 70, 69, 88, 95, 77, 35];


const functionToFilterNumbers = function(grade){
 return grade > 69;
}

// Filter the 'numbers' array
const passingGrades = grades.filter(functionToFilterNumbers)
//Display filtered array
console.log(passingGrades)
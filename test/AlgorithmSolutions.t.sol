// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/AlgorithmSolutions.sol";

contract AlgorithmSolutionsTest is Test {
    AlgorithmSolutions public algorithmSolutions;

    function setUp() public {
        algorithmSolutions = new AlgorithmSolutions();
    }

    function testReverseString() public view {
        assertEq(algorithmSolutions.reverseString(""), "");
        assertEq(algorithmSolutions.reverseString("a"), "a");
        assertEq(algorithmSolutions.reverseString("hello"), "olleh");
        assertEq(algorithmSolutions.reverseString("Hello World"), "dlroW olleH");
    }

    function testIntegerToRoman() public view {
        assertEq(algorithmSolutions.integerToRoman(1), "I");
        assertEq(algorithmSolutions.integerToRoman(5), "V");
        assertEq(algorithmSolutions.integerToRoman(10), "X");
        assertEq(algorithmSolutions.integerToRoman(58), "LVIII");
        assertEq(algorithmSolutions.integerToRoman(100), "C");
        assertEq(algorithmSolutions.integerToRoman(500), "D");
        assertEq(algorithmSolutions.integerToRoman(1000), "M");
        assertEq(algorithmSolutions.integerToRoman(1994), "MCMXCIV");
        assertEq(algorithmSolutions.integerToRoman(1993), "MCMXCIII");
        assertEq(algorithmSolutions.integerToRoman(3999), "MMMCMXCIX");
    }

    function testRomanToInteger() public view {
        assertEq(algorithmSolutions.romanToInteger("I"), 1);
        assertEq(algorithmSolutions.romanToInteger("V"), 5);
        assertEq(algorithmSolutions.romanToInteger("X"), 10);
        assertEq(algorithmSolutions.romanToInteger("LVIII"), 58);
        assertEq(algorithmSolutions.romanToInteger("MCMXCIV"), 1994);
        assertEq(algorithmSolutions.romanToInteger("MCMXCIII"), 1993);
        assertEq(algorithmSolutions.romanToInteger("MMMCMXCIX"), 3999);
    }

    function testMergeTwoSortedArrays() public view {
        uint256[] memory arr1 = new uint256[](3);
        arr1[0] = 1;
        arr1[1] = 3;
        arr1[2] = 5;

        uint256[] memory arr2 = new uint256[](3);
        arr2[0] = 2;
        arr2[1] = 4;
        arr2[2] = 6;

        uint256[] memory result = algorithmSolutions.mergeTwoSortedArrays(arr1, arr2);

        assertEq(result[0], 1);
        assertEq(result[1], 2);
        assertEq(result[2], 3);
        assertEq(result[3], 4);
        assertEq(result[4], 5);
        assertEq(result[5], 6);
    }

    function testBinarySearch() public view {
        uint256[] memory arr = new uint256[](5);
        arr[0] = 1;
        arr[1] = 3;
        arr[2] = 5;
        arr[3] = 7;
        arr[4] = 9;

        assertEq(algorithmSolutions.binarySearch(arr, 1), 0);
        assertEq(algorithmSolutions.binarySearch(arr, 3), 1);
        assertEq(algorithmSolutions.binarySearch(arr, 5), 2);
        assertEq(algorithmSolutions.binarySearch(arr, 7), 3);
        assertEq(algorithmSolutions.binarySearch(arr, 9), 4);
        assertEq(algorithmSolutions.binarySearch(arr, 10), -1);
        assertEq(algorithmSolutions.binarySearch(arr, 0), -1);
    }
} 
# README: Assembly Language Control and Monitoring Assignment

## Overview
This assignment consists of four tasks aimed at implementing basic control and monitoring systems using assembly language. Each task focuses on simulating various real-world applications such as factorial calculation, control programs based on sensor values, and manipulating memory locations and ports to simulate hardware control. The tasks demonstrate fundamental concepts of low-level programming, memory management, and system calls.

## Table of Contents
1. [Task 1: Factorial Calculation](#task-1-factorial-calculation)
2. [Task 2: Sensor Monitoring and Control](#task-2-sensor-monitoring-and-control)
3. [Task 3: Control Program with Motor and Alarm](#task-3-control-program-with-motor-and-alarm)
4. [Task 4: Data Monitoring and Control Using Port-Based Simulation](#task-4-data-monitoring-and-control-using-port-based-simulation)

---

## Task 1: Factorial Calculation

### Problem:
Write an assembly program that calculates the factorial of a given number using recursion. The input number is provided by the user, and the program outputs the result of the factorial.

### Steps:
1. The program prompts the user to enter a number.
2. It then calculates the factorial using a recursive approach.
3. The result is then printed to the screen.

### Key Concepts:
- System calls for input and output.
- Stack operations for recursion.
- Memory management in assembly.

---

## Task 2: Sensor Monitoring and Control

### Problem:
Simulate a sensor monitoring system that reads input values, checks against predefined thresholds, and performs actions like turning on/off a motor or triggering an alarm.

### Steps:
1. The program prompts the user to enter a sensor value (representing water level).
2. Based on the input value:
   - If the value exceeds a high threshold, an alarm is triggered.
   - If the value is below a low threshold, a motor is turned on.
   - If the value falls between the thresholds, the motor is turned off.
3. The program manipulates specific memory locations to track motor and alarm status and prints corresponding messages.

### Key Concepts:
- Threshold checking based on input values.
- Conditional operations for controlling hardware (simulated by memory locations).
- Using memory locations to store and update status (motor and alarm).

---

## Task 3: Control Program with Motor and Alarm

### Problem:
Write an assembly program that simulates controlling a motor and alarm system based on sensor input. The program should:
- Turn on the motor if the sensor value is below a low threshold.
- Trigger the alarm if the sensor value exceeds a high threshold.
- Stop the motor if the sensor value is moderate.

### Steps:
1. The program prompts the user to enter a sensor value.
2. The sensor value is compared to predefined thresholds.
3. Based on the value:
   - If it exceeds the high threshold, the alarm is triggered.
   - If it is below the low threshold, the motor is turned on.
   - If it is between the thresholds, the motor is turned off.

### Key Concepts:
- Memory manipulation for tracking motor and alarm status.
- Using system calls for input/output operations.
- Handling conditional logic based on input values to control hardware simulations.

---

## Task 4: Data Monitoring and Control Using Port-Based Simulation

### Problem:
Simulate a control program that reads a “sensor value” from a specified memory location or input port, and based on the input, performs actions such as:
1. Turning on a motor.
2. Triggering an alarm if the sensor value exceeds a predefined high threshold.
3. Stopping the motor if the sensor value is moderate.

### Steps:
1. The program prompts the user to enter a sensor value.
2. Based on the value:
   - If the value exceeds the high threshold, trigger the alarm.
   - If the value is below the low threshold, turn on the motor.
   - If the value is between the thresholds, stop the motor.
3. The program manipulates specific memory locations (simulating ports) to track the status of the motor and alarm.

### Key Concepts:
- Sensor value input and conversion.
- Comparing sensor values against threshold values to make decisions.
- Memory manipulation to control motor and alarm status.

---

## Assembly Code Structure

Each task contains assembly code structured into different sections:

1. **`.data`**: Contains all the static data used by the program, including strings for messages and predefined values for thresholds, motor status, and alarm status.
2. **`.bss`**: Contains uninitialized variables (buffers) to store user input.
3. **`.text`**: Contains the main program logic, including system calls for input and output, calculations, and condition handling.

### Key System Calls:
- **`int 0x80`**: Used for system calls in Linux assembly. The program uses this for `write`, `read`, and `exit` system calls.
- **`mov`**: Moves data between registers or between registers and memory.
- **`cmp` and `j`**: Used for conditional checks and jumps based on comparisons.

---

## Compilation and Execution

To compile and run each program, follow these steps:

1. **Assemble the Code**:
   ```bash
   nasm -f elf32 <task_name>.asm -o <task_name>.o
   ```

2. **Link the Object File**:
   ```bash
   ld -m elf_i386 <task_name>.o -o <task_name>
   ```

3. **Run the Program**:
   ```bash
   ./<task_name>
   ```

Ensure that you have the appropriate permissions to execute the compiled program. You can modify the program inputs and thresholds as needed by editing the assembly code.

---



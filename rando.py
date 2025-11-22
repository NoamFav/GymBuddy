#!/usr/bin/env python3

import re
import random
import sys


def randomize_quiz_answers(input_file, output_file):
    with open(input_file, "r") as f:
        content = f.read()

    # Pattern to match a complete QuizQuestion
    pattern = r"(QuizQuestion\(\s+category:.*?answers:\s*\[)([^\]]+)(\],\s*correctIndex:\s*)(\d+)(,\s*explanation:.*?\))"

    def shuffle_question(match):
        prefix = match.group(1)
        answers_str = match.group(2)
        middle = match.group(3)
        correct_idx = int(match.group(4))
        suffix = match.group(5)

        # Parse answers
        answers = [a.strip() for a in re.findall(r'"([^"]+)"', answers_str)]

        if len(answers) != 4:
            return match.group(0)  # Return unchanged if not 4 answers

        # Get the correct answer
        correct_answer = answers[correct_idx]

        # Shuffle answers using Fisher-Yates
        for i in range(len(answers) - 1, 0, -1):
            j = random.randint(0, i)
            answers[i], answers[j] = answers[j], answers[i]

        # Find new index of correct answer
        new_correct_idx = answers.index(correct_answer)

        # Rebuild answers string
        new_answers_str = ", ".join([f'"{a}"' for a in answers])

        return f"{prefix}{new_answers_str}{middle}{new_correct_idx}{suffix}"

    # Apply shuffling to all questions
    new_content = re.sub(pattern, shuffle_question, content, flags=re.DOTALL)

    with open(output_file, "w") as f:
        f.write(new_content)

    print(f"✅ Randomized quiz data written to {output_file}")


if __name__ == "__main__":
    input_file = sys.argv[1] if len(sys.argv) > 1 else "QuizData.swift"
    output_file = sys.argv[2] if len(sys.argv) > 2 else "QuizData_randomized.swift"

    randomize_quiz_answers(input_file, output_file)

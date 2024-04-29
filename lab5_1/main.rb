code_fragment = <<-CODE
int add(int a, int b) {
    // implementation
}

integral add(integral a, integral b) {
    // implementation
}

float multiply(float x, float y) {
    // implementation
}

double divide(double p, double q) {
    // implementation
}

void print_message(char message) {
    // implementation
}
CODE

modified_code = code_fragment.gsub(/\b(int|char|float|double)\b/) { |match| match.capitalize }

puts modified_code

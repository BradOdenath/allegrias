// ignore_for_file: non_constant_identifier_names

bool debug = false;
bool test = true;

void print_debug(statement) =>
    ((debug) ? print(statement) : null);

void print_test(statement) =>
    ((test) ? print(statement) : null);
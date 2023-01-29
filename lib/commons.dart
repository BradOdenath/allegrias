// ignore_for_file: non_constant_identifier_names

bool debug = true;
bool test = true;
bool time = true;

String get time_stamp => ((time) ? (DateTime.now().toString() + ': ') : '');

void print_debug(statement) =>
    ((debug) ? print(time_stamp + statement.toString()) : null);

void print_test(statement) =>
    ((test) ? print(time_stamp + statement.toString()) : null);
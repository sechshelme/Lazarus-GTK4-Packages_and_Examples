#define		g_scanner_add_symbol( scanner, symbol, value ) g_scanner_scope_add_symbol ((scanner), 0, (symbol), (value)); 
#define		g_scanner_remove_symbol( scanner, symbol ) g_scanner_scope_remove_symbol ((scanner), 0, (symbol)); 
#define		g_scanner_foreach_symbol( scanner, func, data ) g_scanner_scope_foreach_symbol ((scanner), 0, (func), (data)); 


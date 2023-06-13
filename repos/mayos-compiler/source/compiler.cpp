#include "compiler.hpp"
#include "errors.hpp"
#include "compiler_context.hpp"
#include "expression.hpp"
#include "incomplete_function.hpp"
#include "tokenizer.hpp"
#include "runtime_context.hpp"
#include "push_back_stream.hpp"

namespace mayscript {
    namespace {
        struct possible_flow {
            size_t break_level;
            bool can_continue;
            type_handle return_type_id;

            possible_flow add_switch() {
                return possible_flow{break_level+1, can_continue, return_type_id};
            }

            possible_flow add_loop() {
                return possible_flow{break_level+1, true, return_type_id};
            }

            static possible_flow in_function(type_handle return_type_id) {
                return possible_flow{0, false, return_type_id};
            }

            bool is_typename(const compiler_contexnt&, const tokens_iterator& it) {
                return std::visit(
                    [](const auto& v) {
                        if constexpr (std::is_same_v<decltype(v), const reserved_token&>) {
                            switch (v) {
                                case reserved_token::kw_number:
                                case reserved_token::kw_string:
                                case reserved_token::kw_void:
                                case reserved_token::open_square:
                                    return true;
                                default:
                                    return false;
                            }
                        } else {
                            return false;
                        }
                    },
                    it->get_value()
                );
            }
            error unexpected_syntax(const tokens_iterator& it) {
                return unexcepted_syntax_error(std::to_string(it->get_value()), it->get_line_number(), it->get_char_index());
            }

            std::vector<expression<lvalue>::ptr> compile_variable_declaration(compiler_context& ctx, tokens_iterator& it) {
                type_handle type_id = parse_type(ctx, it);

                if (type_id == type_registry::get_void_handle()) {
                    throw syntax_error("Cannot declare void variable", it->get_line_number(), it->get_char_index());
                }
            }
        }
    }
}

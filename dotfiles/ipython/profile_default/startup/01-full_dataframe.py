from IPython.core.magic import register_line_magic


@register_line_magic
def full(line):
    """Temporarily show all rows of a DataFrame."""
    import pandas as pd
    from IPython.display import display

    df = eval(line, get_ipython().user_ns)

    if not isinstance(df, pd.DataFrame):
        print(f"Object {line} is not a pandas DataFrame.")
        return

    with pd.option_context("display.max_rows", None):
        display(df)

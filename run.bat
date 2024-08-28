@echo off
REM 检查是否提供了查询参数
if "%~1"=="" (
    echo Please provide a query string as a parameter.
    exit /b 1
)

REM 组合查询参数
set "query=%*"

REM 执行DBLP查询并将结果保存到temp.bib文件中
python dblp_request.py --query %query% > temp.bib

REM 调用format_bib.py，将temp.bib格式化并输出到output.bib
python format_bib.py --input_file "temp.bib" --output_file "output.bib"

REM 删除临时文件
del temp.bib

echo Done! The output is saved in output.bib

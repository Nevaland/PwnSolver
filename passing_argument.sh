echo "# stdin"  
echo "python -c \"print \'PAYLOAD\'\" | ./target"
echo ""

echo "# stdin"
echo "(python -c \"print \'PAYLOAD\'\"; cat) | ./target"
echo ""

echo "# argument"
echo "./target \`python -c \"print \'PAYLOAD\'\"\`"
echo ""


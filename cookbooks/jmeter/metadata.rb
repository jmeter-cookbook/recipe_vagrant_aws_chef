%w{ java }.each do |dep|
  depends dep
end

recipe "jmeter", "Installs Apache JMeter"
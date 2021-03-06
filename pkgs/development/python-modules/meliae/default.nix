{ stdenv
, buildPythonPackage
, fetchPypi
, cython
, isPy3k
, simplejson
}:

buildPythonPackage rec {
  pname = "meliae";
  version = "0.4.0.final.0";
  name = "${pname}-${version}";

  src = fetchPypi {
    inherit pname version;
    sha256 = "976519ab02aaa6a8fb5f596dc4dd9f64fc9510b00e054979566e51c9be7cec99";
  };

  disabled = isPy3k;

  doCheck = true;

  checkPhase = ''
    python setup.py build_ext -i
    python run_tests.py
  '';

  checkInputs = [ simplejson ];

  propagatedBuildInputs = [ cython ];

  meta = with stdenv.lib; {
    description = "Python Memory Usage Analyzer";
    homepage = http://launchpad.net/meliae;
    license = licenses.gpl3;
    maintainers = with maintainers; [ xvapx ];
  };
}

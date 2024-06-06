import 'package:flutter/material.dart';

import 'package:prueba/Class/aviso.dart';
import 'package:prueba/Persistencia/DatosDB.dart';

class PaginaAvisosAdmin extends StatefulWidget {
  const PaginaAvisosAdmin({Key? key}) : super(key: key);

  @override
  _PaginaAvisosAdminState createState() => _PaginaAvisosAdminState();
}

class _PaginaAvisosAdminState extends State<PaginaAvisosAdmin> {
  final DatosDB db = DatosDB();
  List<Aviso> _anuncios = [];
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _cuerpoController = TextEditingController();
  final int _itemsPerPage = 5;
  int _currentPage = 0;
  bool _isTituloEmpty = false;
  bool _isCuerpoEmpty = false;

  @override
  void initState() {
    super.initState();
    _loadAvisos();
  }

  Future<void> _loadAvisos() async {
    List<Aviso> avisos = await db.getAvisos();
    setState(() {
      _anuncios = avisos;
    });
  }

  void _showMaxLimitSnackbar() {
    const snackBar = SnackBar(
      content: Text('Se ha alcanzado el límite máximo de anuncios (15)'),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _crearAnuncio() async {
    if (_anuncios.length >= 15) {
      _showMaxLimitSnackbar();
      return;
    }

    final titulo = _tituloController.text.trim();
    final cuerpo = _cuerpoController.text.trim();

    setState(() {
      _isTituloEmpty = titulo.isEmpty;
      _isCuerpoEmpty = cuerpo.isEmpty;

      if (!_isTituloEmpty && !_isCuerpoEmpty) {
        Aviso nuevoAviso = Aviso(
          id: '',
          titulo: titulo,
          cuerpo: cuerpo,
          fecha: 'N/A',
          estado: 'Inactivo',
        );
        db.setAviso(nuevoAviso).then((_) {
          _loadAvisos();
          _tituloController.clear();
          _cuerpoController.clear();
          _isTituloEmpty = false;
          _isCuerpoEmpty = false;
        });
      }
    });
  }

  void _toggleEstado(String id) async {
    int index = _anuncios.indexWhere((aviso) => aviso.id == id);
    if (index != -1) {
      String nuevoEstado =
          _anuncios[index].estado == 'Inactivo' ? 'Activo' : 'Inactivo';
      await db.updateAvisoEstado(id, nuevoEstado);
      _loadAvisos();
    }
  }

  void _eliminarAnuncio(String id) async {
    await db.deleteAviso(id);
    _loadAvisos();
  }

  void _ordenarAnuncios() {
    setState(() {
      _anuncios.sort((a, b) {
        if (a.estado != b.estado) {
          return a.estado == 'Activo' ? -1 : 1;
        }
        return a.fecha.compareTo(b.fecha);
      });
    });
  }

  void _goToPage(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final int totalPages = (_anuncios.length / _itemsPerPage).ceil();
    final int startIndex = _currentPage * _itemsPerPage;
    final int endIndex = startIndex + _itemsPerPage;
    final List<Aviso> currentAnuncios = _anuncios.sublist(
      startIndex,
      endIndex > _anuncios.length ? _anuncios.length : endIndex,
    );

    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, .98),
      appBar: AppBar(
        title: const Text('Administración de Anuncios'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildHeader(),
            _buildAnunciosTable(currentAnuncios),
            _buildPagination(totalPages),
            _buildInputField(),
            const SizedBox(height: 10),
            _buildAddButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'BAZAR Vintage Clothing',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          '15 mil me gusta · 20 mil seguidores',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 20),
        Text(
          'Administración de anuncios',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildAnunciosTable(List<Aviso> currentAnuncios) {
    return Card(
      color: const Color.fromRGBO(250, 250, 250, .98),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 300,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const Expanded(
                  child: Text(
                    'Título',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Fecha de creación',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Estado',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.sort, color: Colors.grey),
                  onPressed: _ordenarAnuncios,
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: currentAnuncios.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(child: Text(currentAnuncios[index].titulo)),
                          Expanded(child: Text(currentAnuncios[index].fecha)),
                          Expanded(
                            child: GestureDetector(
                              onTap: () =>
                                  _toggleEstado(currentAnuncios[index].id),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                decoration: BoxDecoration(
                                  color:
                                      currentAnuncios[index].estado == 'Activo'
                                          ? Colors.green.withOpacity(0.1)
                                          : Colors.red.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  currentAnuncios[index].estado,
                                  style: TextStyle(
                                    color: currentAnuncios[index].estado ==
                                            'Activo'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                _eliminarAnuncio(currentAnuncios[index].id),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              _truncateText(currentAnuncios[index].cuerpo),
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPagination(int totalPages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton(
            onPressed: () => _goToPage(index),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  index == _currentPage ? Colors.black : Colors.white,
              foregroundColor:
                  index == _currentPage ? Colors.white : Colors.black,
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(10),
            ),
            child: Text('${index + 1}'),
          ),
        ),
      ),
    );
  }

  String _truncateText(String text) {
    const maxLength = 50;
    return text.length > maxLength
        ? '${text.substring(0, maxLength)}...'
        : text;
  }

  Widget _buildInputField() {
    return Column(
      children: <Widget>[
        TextField(
          controller: _tituloController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _isTituloEmpty ? Colors.red : Colors.grey,
              ),
            ),
            hintText: 'Título del anuncio',
            errorText: _isTituloEmpty ? 'El título no puede estar vacío' : null,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _cuerpoController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: _isCuerpoEmpty ? Colors.red : Colors.grey,
              ),
            ),
            hintText: 'Cuerpo del anuncio',
            errorText: _isCuerpoEmpty
                ? 'El cuerpo del anuncio no puede estar vacío'
                : null,
          ),
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    return Center(
      child: FloatingActionButton(
        onPressed: _crearAnuncio,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

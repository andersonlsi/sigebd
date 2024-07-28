<div class="row">
    <div class="col-sm-6">
        <div class="page-title-box">
            <?php           
           if ($aluno->id_aluno ?? null) {
            echo "Editar Aluno";
            } else {
            echo "Cadastrar Aluno";
             }
        ?>
        </div>
    </div>
</div>
<?php $this->verMsg(); $this->verErro();?>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <form action="<?php echo URL_BASE . "aluno/salvar" ?>" method="post">

                    <div class="row">
                        <div class="col-sm-8">
                            <h6>Nome</h6>
                            <input type="hidden" name="id_aluno" value="<?php echo $aluno->id_aluno ?? null ?>">
                            <input type="text" class="form-control " name="nome" id="nome"
                                value="<?php echo $aluno->nome ?? null ?>" required>
                        </div>
                        <div class="col-sm-4">
                            <h6>Data de Nascimento</h6>
                            <input type="date" class="form-control " name="dta_nascimento" id="dta_nascimento"
                                value="<?php echo $aluno->dta_nascimento ?? null ?>">
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <div class="col-sm-3">
                            <label>Estado Civil</label>
                            <select class="form-control select" name="estado_civil" id="estado_civil" required>
                                <option value="Solteiro(a)"
                                    <?php echo ($aluno->estado_civil ?? null) == "Solteiro(a)" ? "selected" : ""?>>
                                    Solteiro(a)</option>
                                <option value="Casado(a)"
                                    <?php echo ($aluno->estado_civil ?? null) == "Casado(a)" ? "selected" : ""?>>
                                    Casado(a)</option>
                                <option value="Divorciado(a)"
                                    <?php echo ($aluno->estado_civil ?? null) == "Divorciado(a)" ? "selected" : ""?>>
                                    Divorciado(a)</option>
                                <option value="Víuvo(a)"
                                    <?php echo ($aluno->estado_civil ?? null) == "Víuvo(a)" ? "selected" : ""?>>
                                    Víuvo(a)</option>
                                <option value="Outros"
                                    <?php echo ($aluno->estado_civil ?? null) == "Outros" ? "selected" : ""?>>
                                    Outros
                                </option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label>Sexo</label>
                            <select class="form-control select" name="sexo" id="sexo" required>
                                <option value="M" <?php echo ($aluno->sexo ?? null) == "M" ? "selected" : ""?>>
                                    Masculino</option>
                                <option value="F" <?php echo ($aluno->sexo ?? null) == "F" ? "selected" : ""?>>
                                    Feminino</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label class="form-label">Classe</label>
                            <select class="form-control select2" name="id_classe" id="id_classe" required>
                                <?php foreach ($classe as $c) {
                                    $selecionado = ($aluno->id_classe ?? null) == $c->id_classe ? 'selected' : '';
                                    echo "<option value='$c->id_classe' $selecionado >$c->id_classe - $c->classe</option>";

                                }?>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label class="form-label">Função</label>
                            <select class="form-control select2" name="id_funcao" id="id_funcao" required>
                                <?php foreach ($funcao as $f) {
                                    $selecionado = ($aluno->id_funcao ?? null) == $f->id_funcao ? 'selected' : '';
                                    echo "<option value='$f->id_funcao' $selecionado >$f->id_funcao - $f->funcao</option>";
                                }?>
                            </select>
                        </div>
                    </div>
                    <div><br></div>
                    <div><br></div>
                    <!-- Campos adicionais (escondidos inicialmente) -->

                    <div id="camposAdicionais" style="display: none;">
                        <div class="row">
                            <div class="col-sm-3">
                                <h6>CEP</h6>
                                <input type="text" class="form-control mascara-cep busca_cep " name="cep" id="cep"
                                    value="<?php echo $aluno->cep ?? null ?>">
                            </div>
                            <div class="col-sm-6">
                                <h6>Endereço</h6>
                                <input type="text" class="form-control rua " name="endereco" id="endereco"
                                    value="<?php echo $aluno->endereco ?? null ?>" readonly>
                            </div>
                            <div class="col-sm-3">
                                <h6>Número</h6>
                                <input type="number" class="form-control " name="numero" id="numero"
                                    value="<?php echo $aluno->numero ?? null ?>">
                            </div>
                        </div>
                        <div><br></div>
                        <div class="row">
                            <div class="col-sm-4">
                                <h6>Bairro</h6>
                                <input type="text" class="form-control bairro" name="bairro" id="bairro"
                                    value="<?php echo $aluno->bairro ?? null ?>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <h6>Cidade</h6>
                                <input type="text" class="form-control cidade" name="cidade" id="cidade"
                                    value="<?php echo $aluno->cidade ?? null ?>" readonly>
                            </div>
                            <div class="col-sm-4">
                                <h6>Estado</h6>
                                <input type="text" class="form-control estado" name="estado" id="estado"
                                    value="<?php echo $aluno->estado ?? null ?>" readonly>
                            </div>
                        </div>
                        <div><br></div>
                        <div class="row">
                            <div class="col-sm-6">
                                <h6>Email</h6>
                                <input type="email" class="form-control " name="email" id="email"
                                    value="<?php echo $aluno->email ?? null ?>">
                            </div>
                            <div class="col-sm-6">
                                <h6>Celular</h6>
                                <input type="text" class="form-control mascara-celular " name="cel" id="cel"
                                    value="<?php echo $aluno->cel ?? null ?>">
                            </div>
                        </div>
                        <div><br></div>
                        <div class="row">
                            <div class="col-sm-8">
                                <h6>Responsável</h6>
                                <input type="text" class="form-control " name="responsavel" id="responsavel"
                                    value="<?php echo $aluno->responsavel ?? null ?>">
                            </div>
                            <div class="col-sm-4">
                                <h6>Celular do Resp.</h6>
                                <input type="text" class="form-control mascara-celular" name="cel_resp" id="cel_resp"
                                    value="<?php echo $aluno->cel_resp ?? null ?>">
                            </div>
                        </div>
                        <div><br></div>
                        <div class="row">
                            <div class="col-sm">
                                <h6>Observação</h6>
                                <textarea id="observacao" name="observacao" class="form-control" maxlength="225"
                                    rows="3"
                                    placeholder="Observação..."><?php echo htmlspecialchars($aluno->observacao ?? null) ?></textarea>
                            </div>
                        </div>
                    </div>
                    <div><br></div>
                    <div class="row">
                        <button type="button" class="btn btn-link" id="mostrarMaisBtn">Formulário completo</button>
                        <div class="col-sm-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="ion ion-md-save"></i>
                                Salvar
                            </button>
                            <a href="<?php echo URL_BASE . "aluno" ?>" class="btn btn-success" role="button"
                                aria-pressed="true">
                                <i class="ion ion-md-return-left"></i>
                                Voltar
                            </a>
                        </div>
                    </div>
                    <div><br></div>
                </form>

            </div>
        </div>
    </div>
</div>
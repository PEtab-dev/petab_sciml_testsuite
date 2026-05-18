"""Neural network import test generation"""

import torch
from torch import nn
from torch.nn import functional as F
from pysrc.ml_import_helper import make_yaml, test_nn


class Net(nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.layer1 = nn.Linear(2, 5)

    def forward(self, net_input: torch.Tensor) -> torch.Tensor:
        out = F.softmax(net_input, dim=0)
        return out


def ml_model_import_040(dir_save):
    net = Net()
    make_yaml(net, dir_save)
    test_nn(net, dir_save, None)
    return 0
